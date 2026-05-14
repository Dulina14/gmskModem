clc; clear; close all;

SNR_dB_range = 0:2:30;
MIN_ERRORS   = 1000;
MAX_BITS     = 1e5;
targetBER    = 1e-5;

%% Files
inputFile = 'tx_data.csv';

%% TX
[txSignal, waveform, signalPower] = tx_chain(inputFile);

txBytesOrig = load_payload_bytes(inputFile, waveform.pldLenInfBytes);
infoBitsOrig = bytes_to_bits(txBytesOrig);
expectedInfoBits = length(infoBitsOrig);

BER_results = zeros(size(SNR_dB_range));
totalBitsVec = zeros(size(SNR_dB_range));
totalErrVec = zeros(size(SNR_dB_range));

%% BER sweep
for idx = 1:length(SNR_dB_range)
    SNR_dB = SNR_dB_range(idx);
    totalBitErrors = 1;
    totalBits = 0;

    while (totalBitErrors < MIN_ERRORS) && (totalBits < MAX_BITS)
        rxSignal = channel_model(txSignal, signalPower, SNR_dB);

        %% RX
        decodedData = rx_chain(rxSignal);

        if isempty(decodedData) || isempty(decodedData{1})
            totalBitErrors = totalBitErrors + expectedInfoBits;
            totalBits = totalBits + expectedInfoBits;
            continue;
        end

        rxBytes = uint8(decodedData{1}(:));
        if length(rxBytes) < waveform.pldLenInfBytes
            rxBytes = [rxBytes; zeros(waveform.pldLenInfBytes - length(rxBytes), 1, 'uint8')];
        else
            rxBytes = rxBytes(1:waveform.pldLenInfBytes);
        end

        decodedBits = bytes_to_bits(rxBytes);

        bitErrors = sum(infoBitsOrig ~= decodedBits(1:expectedInfoBits));
        totalBitErrors = totalBitErrors + bitErrors;
        totalBits = totalBits + expectedInfoBits;
    end

    BER_results(idx) = totalBitErrors / totalBits;
    totalBitsVec(idx) = totalBits;
    totalErrVec(idx) = totalBitErrors;
    fprintf('SNR = %.1f dB: totalBits = %d, totalBitErrors = %d\n', ...
        SNR_dB, totalBits, totalBitErrors);

end

figure;
semilogy(SNR_dB_range, BER_results, 'o-', 'LineWidth', 1.5, 'MarkerSize', 7);
grid on;
xlabel('SNR (dB)');
ylabel('BER');
title('BER vs SNR');
hold on;
yline(targetBER, '--', sprintf('BER = 10^{%d}', round(log10(targetBER))), ...
    'LabelHorizontalAlignment', 'left');

targetSNR = estimate_target_snr(SNR_dB_range, BER_results, targetBER);
if ~isnan(targetSNR)
    semilogy(targetSNR, targetBER, 'rx', 'MarkerSize', 10, 'LineWidth', 2);
    text(targetSNR, targetBER, sprintf('  %.2f dB @ BER = %.1e', targetSNR, targetBER), ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');
end
hold off;

results = struct();
results.SNR_dB_range = SNR_dB_range(:);
results.BER = BER_results(:);
results.totalBits = totalBitsVec(:);
results.totalErrors = totalErrVec(:);
results.targetBER = targetBER;
results.targetSNR_dB = targetSNR;

function txBytes = load_payload_bytes(txCsvFile, expectedBytes)
    txData = read_axi_stream_csv(txCsvFile);
    txBytes = uint8(txData.bytes(:));

    if length(txBytes) < expectedBytes
        txBytes = [txBytes; zeros(expectedBytes - length(txBytes), 1, 'uint8')];
    else
        txBytes = txBytes(1:expectedBytes);
    end
end

function bits = bytes_to_bits(byteVec)
    bits = false(length(byteVec) * 8, 1);
    k = 1;
    for b = byteVec(:).'
        bits(k:k+7) = logical(bitget(uint8(b), 8:-1:1));
        k = k + 8;
    end
end

function targetSNR = estimate_target_snr(SNR_dB_range, BER_results, targetBER)
    targetSNR = NaN;

    valid = isfinite(BER_results) & (BER_results > 0);
    snr = SNR_dB_range(valid);
    ber = BER_results(valid);

    if length(snr) < 2
        return;
    end

    for i = 2:length(snr)
        y1 = ber(i-1);
        y2 = ber(i);
        if (y1 >= targetBER && y2 <= targetBER) || (y1 <= targetBER && y2 >= targetBER)
            x1 = snr(i-1);
            x2 = snr(i);
            ly1 = log10(y1);
            ly2 = log10(y2);
            lyt = log10(targetBER);
            targetSNR = x1 + (lyt - ly1) * (x2 - x1) / (ly2 - ly1);
            return;
        end
    end
end
