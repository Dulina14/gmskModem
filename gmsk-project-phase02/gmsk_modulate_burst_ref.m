function [s_ref, trainSampleIdx, burstLenSamples] = gmsk_modulate_burst_ref( ...
        burstBitsRef, bitMapMask, gaussFilt, gmskMap)
% GMSK_MODULATE_BURST_REF  Re-modulate known burst bits through the SAME
%   GaussianFilter and GmskMapper objects used at the transmitter, producing
%   an ideal complex GMSK reference for  LMS channel equalization.
%
% TX signal path replicated here (bit-exact):
%   burstBitsRef
%       → GaussianFilter.step()   [repelem → NRZ → conv('full') → sat16 Q15]
%       → GmskMapper.step()       [acc=0 → phase accum → mod(512) → cos/sin LUT]
%       → complex double, amplitude ≈ 32767 (raw Q15)
%       → group-delay trim        [remove leading (Ntaps-1)/2 samples]
%       → unit-amplitude normalise
%       = s_ref
%
% WHY this must use the real TX objects (not a custom modulator):
%   • GaussianFilter uses a direct Gaussian formula (BT=0.35). Any mismatch in the filter
%     shape causes a systematic reference error that the LMS cannot correct.
%   • GmskMapper uses integer phase accumulation + 512-point LUT. Floating-
%     point atan2 gives different phase quantisation at every sample.
%   • Both objects embed Q15 quantisation. Using float equivalents produces
%     a reference that diverges by hundreds of milli-radians per burst.
%
% Inputs:
%   burstBitsRef  : uint8 column vector (0/1), length = waveform.burstBlockLen.
%                   Build with buildBurstRef(waveform):
%                     • preamble positions  → waveform.prmbSeq  (known)
%                     • training positions  → waveform.trngSeq  (known)
%                     • payload positions   → 0 (unknown; NRZ −1 in filter)
%   bitMapMask    : uint8 row vector, same length. 1=preamble,2=payload,3=training
%   gaussFilt     : GaussianFilter object (same params as TX: BT=0.35, SPS=4, span=8)
%   gmskMap       : GmskMapper object    (same params as TX: lutSize=512, bitGainReduct=8)
%
% Outputs:
%   s_ref          : complex double column, length = burstBlockLen*SPS (e.g. 2496).
%                    Unit-amplitude. Aligned sample-for-sample with rx_burst.
%   trainSampleIdx : double column. ALL sample indices (1-based) in s_ref/rx_burst
%                    that correspond to training bits (trngSeqLen × SPS entries).
%                    Pass directly to lms_equalizer_complex.
%   burstLenSamples: scalar = burstBlockLen*SPS. Extract rx_burst with this length.
%
% Payload-as-zero side effect:
%   Payload bits set to 0 (→ NRZ −1) create a deterministic phase ramp in
%   payload regions. This bleeds into training chunk boundaries over a window
%   of (Ntaps-1)/2/SPS = 4 symbols. The interior 4 bits of each 8-bit training
%   chunk (bits 3–6) produce a clean, accurate reference. Boundary samples are
%   still valid for NLMS convergence — the LMS adapts to whatever phase offset
%   exists, as the error drives the taps toward the correct channel inverse.

    %% ---- Input validation ----
    burstBitsRef = uint8(burstBitsRef(:));
    bitMapMask   = bitMapMask(:);
    Nbits        = length(burstBitsRef);

    assert(length(bitMapMask) == Nbits, ...
        'burstBitsRef length (%d) != bitMapMask length (%d)', ...
        Nbits, length(bitMapMask));
    assert(isa(gaussFilt, 'GaussianFilter'), ...
        'gaussFilt must be a GaussianFilter instance');
    assert(isa(gmskMap, 'GmskMapper'), ...
        'gmskMap must be a GmskMapper instance');

    SPS         = gaussFilt.SPS;
    spanSymbols = gaussFilt.spanSymbols;
    Ntaps       = spanSymbols * SPS + 1;   % 8*4+1 = 33 (default)
    gd          = (Ntaps - 1) / 2;         % group delay = 16 samples

    burstLenSamples = Nbits * SPS;         % 624 * 4 = 2496 samples (waveform 0)

    %% ---- Step 1: Gaussian frequency shaping (TX-identical) ----
    % GaussianFilter.stepImpl:
    %   repelem(bits, SPS) → NRZ ±1 → conv(NRZ, tapsQ15, 'full') → sat16
    % Output length = Nbits*SPS + (Ntaps-1) = 2496 + 32 = 2528 samples
    filtOut = gaussFilt(burstBitsRef);     % int16 column, length = burstLenSamples + 2*gd

    %% ---- Step 2: Phase accumulation + LUT mapping (TX-identical) ----
    % GmskMapper.stepImpl: acc resets to 0 at every call (not persistent).
    % bv = floor(filtOut / 2^bitGainReduct)  [divides by 256]
    % Accumulates bv, wraps index mod 512, looks up cos/sin Q15 LUT.
    % Output: double(cosLUT) + 1i*double(sinLUT), amplitude ≈ 32767.
    s_full = gmskMap(filtOut);             % complex double, same length as filtOut

    %% ---- Step 3: Group-delay compensation ----
    % conv('full') introduces a delay of gd samples at the output start.
    % Trim so that s_ref[n] corresponds to burst bit ceil(n/SPS).
    %   s_full(1..gd)                       → pre-burst filter transient  [discard]
    %   s_full(gd+1 .. gd+burstLenSamples)  → aligned burst signal        [keep]
    %   s_full(gd+burstLenSamples+1 .. end) → post-burst tail             [discard]
    s_trimmed = s_full(gd + 1 : gd + burstLenSamples);   % (burstLenSamples × 1)

    %% ---- Step 4: Unit-amplitude normalisation ----
    % Raw GmskMapper output is Q15-scaled (~32767). rx_burst from the channel
    % has arbitrary gain. Normalise s_ref to unit amplitude so the LMS error
    % signal is dimensionless and mu is meaningful across different SNR/gain.
    % Use median for robustness against channel nulls at burst edges.
    amp   = median(abs(s_trimmed));
    if amp < 1e-6
        error('gmsk_modulate_burst_ref: s_ref amplitude near zero — check burstBitsRef');
    end
    s_ref = s_trimmed / amp;               % unit-amplitude complex column

    %% ---- Step 5: Training sample indices ----
    % Training bit bp (1-based position in burst bitMapMask) occupies
    % samples (bp-1)*SPS+1 through bp*SPS in the aligned burst.
    % We use ALL SPS samples per training bit — 4× more update points than
    % using only one sample per symbol.
    trainBitPos    = find(bitMapMask == 3);
    T              = length(trainBitPos);
    trainSampleIdx = zeros(T * SPS, 1);
    for k = 1:T
        bp  = trainBitPos(k);
        s0  = (bp - 1) * SPS + 1;
        trainSampleIdx((k-1)*SPS + (1:SPS)) = s0 : s0 + SPS - 1;
    end

    %% ---- Diagnostics ----
    nChunks = T / (size(find(bitMapMask==3 & (1:Nbits)'==trainBitPos(1)),1));  %#ok
    fprintf(['[gmsk_modulate_burst_ref]\n' ...
             '  Burst: %d bits → %d nominal samples | gd=%d | full conv=%d\n' ...
             '  Training: %d bits (4 chunks × %d bits) → %d LMS reference samples\n' ...
             '  s_ref: median amp=%.1f → normalised to 1.0 | ' ...
             'min|s|=%.4f  max|s|=%.4f\n\n'], ...
        Nbits, burstLenSamples, gd, length(s_full), ...
        T, T/4, length(trainSampleIdx), ...
        amp, min(abs(s_ref)), max(abs(s_ref)));
end

