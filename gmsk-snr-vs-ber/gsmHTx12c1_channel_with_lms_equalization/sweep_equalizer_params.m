function results = sweep_equalizer_params(txCsvFile, SNR_dB, muValues, eqLenValues, delayValues)
% SWEEP_EQUALIZER_PARAMS Evaluate receiver settings by payload byte errors.

    if nargin < 1 || isempty(txCsvFile)
        txCsvFile = 'tx_data.csv';
    end
    if nargin < 2 || isempty(SNR_dB)
        SNR_dB = 100;
    end
    if nargin < 3 || isempty(muValues)
        muValues = [0.01 0.05 0.1 0.2];
    end
    if nargin < 4 || isempty(eqLenValues)
        eqLenValues = [9 13 17];
    end
    if nargin < 5 || isempty(delayValues)
        delayValues = 0:2:12;
    end

    [txSignal, waveform, signalPower] = tx_chain(txCsvFile);
    rxSignal = channel_model(txSignal, signalPower, SNR_dB);

    txData = read_axi_stream_csv(txCsvFile);
    txBytes = uint8(txData.bytes(:));
    if length(txBytes) < waveform.pldLenInfBytes
        txBytes = [txBytes; zeros(waveform.pldLenInfBytes - length(txBytes), 1, 'uint8')];
    else
        txBytes = txBytes(1:waveform.pldLenInfBytes);
    end

    gaussFilt = GaussianFilter('BT', 0.35, 'SPS', 4, 'spanSymbols', 8, 'gainAdj', 0);
    gmskMap   = GmskMapper('lutSize', 512, 'accBits', 16, 'bitGainReduct', 8);
    rxDemod   = RxDemodulator('samplesPerSymbol', 4, 'gaussSpanSymbols', 8);

    burstBitsRef = zeros(waveform.burstBlockLen, 1, 'uint8');
    burstBitsRef(waveform.bitMapMask == 1) = waveform.prmbSeq(:);
    burstBitsRef(waveform.bitMapMask == 3) = waveform.trngSeq(:);

    [s_ref, ~, ~] = gmsk_modulate_burst_ref( ...
        burstBitsRef, waveform.bitMapMask, gaussFilt, gmskMap);
    trainSampleIdx = preamble_sample_indices(waveform.bitMapMask, gaussFilt.SPS);

    llr_full = rxDemod(rxSignal);
    [detections, ~] = detect_preamble( ...
        llr_full, double(waveform.prmbSeq), 0.7, 500, false);

    if isempty(detections)
        error('sweep_equalizer_params: no bursts detected');
    end

    demodGroupDelay = floor((rxDemod.gaussSpanSymbols * rxDemod.samplesPerSymbol) / 2);
    burstStart = (detections(1).index - 1) * gaussFilt.SPS + demodGroupDelay + 1;
    burstStop  = burstStart + waveform.burstBlockLen * gaussFilt.SPS - 1;
    rxBurst = rxSignal(burstStart:burstStop);
    rxNorm  = rxBurst / median(abs(rxBurst));

    payloadMask = (waveform.bitMapMask == 2);
    comboCount = length(muValues) * length(eqLenValues) * length(delayValues);
    results = repmat(struct( ...
        'mu', 0, 'eq_len', 0, 'decisionDelay', 0, ...
        'byteErrors', inf, 'bitErrors', inf, 'mseFinal', inf), comboCount, 1);

    row = 0;
    for eq_len = eqLenValues
        for decisionDelay = delayValues
            validTrainIdx = trainSampleIdx(trainSampleIdx >= eq_len + decisionDelay);
            if length(validTrainIdx) < eq_len * 3
                continue;
            end

            for mu = muValues
                row = row + 1;

                [y_eq, ~, mse_curve] = lms_equalizer_complex( ...
                    rxNorm, s_ref, validTrainIdx, mu, eq_len, decisionDelay);

                symMetrics = demod_aligned_burst(y_eq, gaussFilt.SPS, waveform.burstBlockLen);
                payloadMetrics = symMetrics(payloadMask);

                decodedBits = viterbi_soft_decoder(payloadMetrics, 32);
                decodedBits = decodedBits(1 : waveform.pldLenInfBytes * 8);

                rxBytes = zeros(waveform.pldLenInfBytes, 1, 'uint8');
                for b = 1:waveform.pldLenInfBytes
                    byteBits = decodedBits((b - 1) * 8 + 1 : b * 8);
                    rxBytes(b) = uint8(sum(byteBits(:)' .* (2 .^ (7:-1:0))));
                end

                txBits = reshape(de2bi(txBytes, 8, 'left-msb').', [], 1);
                bitErrors = sum(decodedBits ~= txBits);
                byteErrors = sum(rxBytes ~= txBytes);

                results(row).mu = mu;
                results(row).eq_len = eq_len;
                results(row).decisionDelay = decisionDelay;
                results(row).byteErrors = byteErrors;
                results(row).bitErrors = bitErrors;
                results(row).mseFinal = mse_curve(end);

                fprintf(['[SWEEP] mu=%0.3f eq_len=%2d delay=%2d | ' ...
                         'byteErrors=%2d bitErrors=%3d mseFinal=%0.4f\n'], ...
                    mu, eq_len, decisionDelay, byteErrors, bitErrors, mse_curve(end));
            end
        end
    end

    results = results(1:row);
    if isempty(results)
        error('sweep_equalizer_params: no valid parameter combinations tested');
    end

    [~, bestIdx] = sortrows([[results.byteErrors].', [results.bitErrors].', [results.mseFinal].'], [1 2 3]);
    results = results(bestIdx);

    best = results(1);
    fprintf(['\n[SWEEP] Best: mu=%0.3f eq_len=%d delay=%d | ' ...
             'byteErrors=%d bitErrors=%d mseFinal=%0.4f\n\n'], ...
        best.mu, best.eq_len, best.decisionDelay, ...
        best.byteErrors, best.bitErrors, best.mseFinal);
end
