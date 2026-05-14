function allDecodedBytes = rx_chain(rx_full)

%rx_data csv file
csvOutputFile = 'rx_data.csv';


%% =========================================================================
%% SECTION 1: Shared objects (create ONCE, reuse across all bursts)
%% =========================================================================

% -- Waveform structure ---------------------------------------------------
waveform = Waveform('waveformId', 0);

% Verify structure (catches the rng-seed bug from Waveform.m if present)
assert(waveform.burstBlockLen == ...
       waveform.prmbSeqLen + waveform.pldLenEncBits + waveform.trngSeqLen, ...
       'Waveform burstBlockLen mismatch — check Waveform.init()');
assert(sum(waveform.bitMapMask == 1) == waveform.prmbSeqLen, 'Preamble mask mismatch');
assert(sum(waveform.bitMapMask == 3) == waveform.trngSeqLen, 'Training mask mismatch');

% -- TX objects (used here for reference signal generation) ---------------
gaussFilt = GaussianFilter('BT', 0.35, 'SPS', 4, 'spanSymbols', 8, 'gainAdj', 0);
gmskMap   = GmskMapper('lutSize', 512, 'accBits', 16, 'bitGainReduct', 8);

% -- RX demodulator objects -----------------------------------------------
rxDemod = RxDemodulator('samplesPerSymbol', 4, 'gaussSpanSymbols', 8);

% -- Build reference burst (known bits only, payload = 0) -----------------
burstBitsRef = buildBurstRef(waveform);

% -- Equalizer parameters -------------------------------------------------
mu     = 0.05;
eq_len = 13;
TB_LEN = 32;
decisionDelay = floor((eq_len - 1) / 2);

% -- System dimensions ----------------------------------------------------
SPS             = gaussFilt.SPS;
burstLenSamples = waveform.burstBlockLen * SPS;
payloadMask     = (waveform.bitMapMask == 2);
demodGroupDelay = floor((rxDemod.gaussSpanSymbols * rxDemod.samplesPerSymbol) / 2);

%% =========================================================================
%% SECTION 2: Coarse demodulation — preamble detection
%% =========================================================================

llr_full = rxDemod(rx_full);

[detections, ~] = detect_preamble( ...
    llr_full, double(waveform.prmbSeq), ...
    0.7, ...
    500, ...
    true);

fprintf('Found %d bursts\n\n', length(detections));

%% =========================================================================
%% SECTION 3: Pre-compute reference signal
%% =========================================================================

[s_ref, ~, ~] = gmsk_modulate_burst_ref( ...
    burstBitsRef, waveform.bitMapMask, gaussFilt, gmskMap);

trainSampleIdx = preamble_sample_indices(waveform.bitMapMask, SPS);
trainSampleIdx = trainSampleIdx(trainSampleIdx >= eq_len + decisionDelay);

assert(min(trainSampleIdx) >= eq_len + decisionDelay, ...
    ['First training sample (%d) < eq_len + decisionDelay (%d). ' ...
     'Increase eq_len or adjust training placement.'], ...
    min(trainSampleIdx), eq_len + decisionDelay);

%% =========================================================================
%% SECTION 4: Per-burst processing
%% =========================================================================

allDecodedBytes = cell(length(detections), 1);

for d = 1:length(detections)

    fprintf('=== Burst %d (bit index %d, corr %.3f) ===\n', ...
        d, detections(d).index, detections(d).correlation);

    burstStartSample = (detections(d).index - 1) * SPS + demodGroupDelay + 1;
    burstEndSample   = burstStartSample + burstLenSamples - 1;

    if burstEndSample > length(rx_full)
        warning('Burst %d truncated by end of recording — skipping', d);
        continue;
    end

    rx_burst = rx_full(burstStartSample : burstEndSample);

    rxAmp = median(abs(rx_burst));
    if rxAmp < 1e-9
        warning('Burst %d: rx_burst amplitude near zero — likely empty burst, skipping', d);
        continue;
    end
    rx_norm = rx_burst / rxAmp;
    
%   [y_eq, w_final, mse_curve] = lms_equalizer_complex(rx_norm, s_ref, trainSampleIdx, mu, eq_len);
    [y_eq, ~, mse_curve] = lms_equalizer_complex( ...
        rx_norm, s_ref, trainSampleIdx, mu, eq_len, decisionDelay);


    figure; plot(mse_curve);
    xlabel('Training update #'); ylabel('|e|^2');
    title(sprintf('Burst %d MSE',d));

    % y_eq is already aligned to the nominal burst window, so using
    % RxDemodulator here would trim group delay a second time and drop
    % 8 symbols.
    symMetrics = demod_aligned_burst(y_eq, SPS, waveform.burstBlockLen);
    if length(symMetrics) < waveform.burstBlockLen
        warning('Burst %d: symMetrics length %d < burstBlockLen %d — skipping', ...
            d, length(symMetrics), waveform.burstBlockLen);
        continue;
    end
    symMetrics = symMetrics(1 : waveform.burstBlockLen);

    payloadMetrics = symMetrics(payloadMask);

    decoded_bits = viterbi_soft_decoder(payloadMetrics, TB_LEN);

    numInfoBits = waveform.pldLenInfBytes * 8;
    if length(decoded_bits) >= numInfoBits
        decoded_bits = decoded_bits(1 : numInfoBits);
    end

    decoded_bytes = zeros(waveform.pldLenInfBytes, 1, 'uint8');
    for b = 1:waveform.pldLenInfBytes
        byte_bits = decoded_bits((b-1)*8 + 1 : b*8);
        decoded_bytes(b) = uint8(sum(byte_bits(:)' .* (2.^(7:-1:0))));
    end

    allDecodedBytes{d} = decoded_bytes;

    fprintf('  Decoded %d bytes | MSE_final=%.4f\n\n', ...
        length(decoded_bytes), mse_curve(end));
end

% Save to CSV
allDecodedBytesMat = cell2mat(allDecodedBytes);
write_axi_stream_csv(csvOutputFile, allDecodedBytesMat);


end


%% =========================================================================
%% LOCAL FUNCTION (UNCHANGED)
%% =========================================================================
function burstBitsRef = buildBurstRef(waveform)

    burstBitsRef = zeros(waveform.burstBlockLen, 1, 'uint8');
    burstBitsRef(waveform.bitMapMask == 1) = waveform.prmbSeq(:);
    burstBitsRef(waveform.bitMapMask == 3) = waveform.trngSeq(:);

end
