function [y, w_final, mse_curve] = lms_equalizer_complex(rx, s_ref, trainSampleIdx, mu, eq_len, decisionDelay)
% LMS_EQUALIZER_COMPLEX  Complex baseband NLMS equalizer for GMSK Option B.
%
% Operates on complex samples BEFORE GmskDemapper.  The reference s_ref must
% be the unit-amplitude output of gmsk_modulate_burst_ref — which itself runs
% the actual GaussianFilter and GmskMapper TX objects.
%
% System model:
%   rx(n)  = h * s_tx(n) + noise          (FIR channel convolution)
%   y(n)   = w^H · u(n)  ≈ s_ref(n)       (equalizer output ≈ ideal TX signal)
%
% NLMS update on training samples only:
%   e(n) = s_ref(n) − y(n)                (complex error)
%   w    ← w + (μ / (‖u‖² + ε)) · u · conj(e)
%
% Inputs:
%   rx             : complex column vector — extracted burst (length N = burstLenSamples)
%                    Normalise to unit amplitude before passing:
%                      rx = rx / median(abs(rx));
%   s_ref          : complex column vector, same length N — from gmsk_modulate_burst_ref
%                    Already unit-amplitude.
%   trainSampleIdx : integer column — from gmsk_modulate_burst_ref output.
%                    All indices must satisfy: eq_len ≤ idx ≤ N.
%   mu             : NLMS step size. Range: (0, 2).
%                    Start: 0.05 (moderate SNR).  Lower for noisy channels.
%   eq_len         : Tap count (odd preferred, e.g. 9, 13, 17).
%                    Rule: eq_len ≤ length(trainSampleIdx) / 6
%                    For waveform-0 (32 trng bits × SPS=4 = 128 samples): max = 21.
%                    Typical GSM TU (3–4 symbol spread): 9–13.
%
% Outputs:
%   y              : complex column, length N — equalizer output.
%                    Pass to RxDemodulator (which calls GmskDemapper internally).
%   w_final        : complex column, eq_len × 1 — converged tap vector.
%   mse_curve      : real vector — |e(n)|² at each training update (for tuning).
%
% Typical call sequence (Option B full chain):
%   rx_n   = rx_burst / median(abs(rx_burst));        % normalise rx
%   [y_eq, w, mse] = lms_equalizer_complex(rx_n, s_ref, trainSampleIdx, 0.05, 9);
%   symMetrics     = rxDemod(y_eq);                   % GmskDemapper + sample
%   payloadMetrics = symMetrics(waveform.bitMapMask==2);
%   decodedBits    = viterbi_soft_decoder(payloadMetrics, TB_LEN);

    if nargin < 6
        decisionDelay = 0;
    end

    %% ---- Input validation ----
    rx             = rx(:);
    s_ref          = s_ref(:);
    trainSampleIdx = trainSampleIdx(:);
    N              = length(rx);

    assert(length(s_ref) == N, ...
        'rx (%d) and s_ref (%d) must have the same length', N, length(s_ref));
    assert(all(trainSampleIdx >= eq_len + decisionDelay) && all(trainSampleIdx <= N), ...
        ['trainSampleIdx out of range for eq_len=%d, decisionDelay=%d, N=%d. ' ...
         'Got [%d, %d]'], ...
        eq_len, decisionDelay, N, min(trainSampleIdx), max(trainSampleIdx));
    assert(mu > 0 && mu < 2, ...
        'Step size mu must be in (0,2), got %g', mu);
    assert(mod(eq_len,1)==0 && eq_len >= 1, ...
        'eq_len must be a positive integer, got %g', eq_len);
    assert(mod(decisionDelay,1)==0 && decisionDelay >= 0, ...
        'decisionDelay must be a non-negative integer, got %g', decisionDelay);

    nTrain = length(trainSampleIdx);
    assert(nTrain >= eq_len * 3, ...
        ['Insufficient training samples (%d) for eq_len=%d. ' ...
         'Need at least 3× eq_len. Reduce eq_len or increase training.'], ...
        nTrain, eq_len);

    %% ---- Initialise ----
    w          = zeros(eq_len, 1);           % complex tap vector, all zeros
    y          = zeros(N, 1);               % complex equalizer output
    mse_curve  = zeros(nTrain, 1);          % one entry per training update

    trainSet    = false(N, 1);
    trainSet(trainSampleIdx) = true;

    reg         = 1e-10;                    % NLMS denominator regularisation
    updateCount = 0;

    %% ---- NLMS loop ----
    for i = eq_len : N
        % Causal tap buffer — newest sample at index 1
        u    = rx(i : -1 : i - eq_len + 1);   % (eq_len × 1) complex

        % Equalizer output
        y(i) = w' * u;                         % conjugate transpose dot product

        % Weight update only where we have a clean reference (training samples)
        if trainSet(i)
            refIdx = i - decisionDelay;
            e   = s_ref(refIdx) - y(i);        % complex error
            pwr = real(u' * u) + reg;          % normalised power (real, regularised)
            w   = w + (mu / pwr) * u * conj(e);

            updateCount = updateCount + 1;
            mse_curve(updateCount) = real(e * conj(e));   % |e|²
        end
    end

    w_final   = w;
    mse_curve = mse_curve(1 : updateCount);   % trim unused tail

    if decisionDelay > 0
        y = [y(decisionDelay + 1 : end); zeros(decisionDelay, 1)];
    end

    %% ---- Diagnostics ----
    if updateCount == 0
        warning('lms_equalizer_complex: zero training updates — check trainSampleIdx');
        return;
    end

    % Convergence check: compare first 25% vs last 25% of MSE curve
    q  = max(1, floor(updateCount / 4));
    m1 = mean(mse_curve(1:q));
    m2 = mean(mse_curve(end-q+1:end));
    converged = m2 < 0.5 * m1;

    fprintf(['[lms_equalizer_complex]\n' ...
             '  Updates: %d | eq_len: %d | mu: %g | decisionDelay: %d\n' ...
             '  MSE: initial=%.4f  final=%.4f  %s\n' ...
             '  Tap power: %.4f\n\n'], ...
        updateCount, eq_len, mu, decisionDelay, ...
        mse_curve(1), mse_curve(end), ...
        char(converged * '  CONVERGED  ' + ~converged * 'NOT CONVERGED'), ...
        real(w_final' * w_final));
end
