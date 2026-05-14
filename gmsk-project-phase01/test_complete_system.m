%% Complete GMSK Transceiver with CSV Input/Output and Packet Structure
% This script demonstrates:
% 1. Reading data from AXI-Stream CSV file
% 2. Building packet with preamble and training sequences
% 3. Convolutional encoding and GMSK modulation
% 4. Channel with noise
% 5. GMSK demodulation and soft Viterbi decoding
% 6. Preamble detection and payload extraction
% 7. Writing recovered data back to CSV

clear; clc; close all;

%% Parameters
EbN0_dB = 10;            % SNR in dB
SPS = 4;                % Samples per symbol
BT = 0.35;              % Gaussian filter BT product
PREAMBLE_THRESHOLD = 0.65;  % Preamble detection threshold

%% File paths
csvInputFile = 'tx_data.csv';  
csvOutputFile = 'rx_data.csv';


%% Read Input CSV
csvData = read_axi_stream_csv(csvInputFile);
fprintf('Read %d bytes from CSV\n', length(csvData.bytes));
fprintf('Total bits: %d\n\n', length(csvData.bits));

%% Setup Waveform Structure
waveform = Waveform('waveformId', 0);
fprintf('Waveform structure:\n');
fprintf('  Preamble length: %d bits\n', waveform.prmbSeqLen);
fprintf('  Payload length (encoded): %d bits\n', waveform.pldLenEncBits);
fprintf('  Training seq length: %d bits\n', waveform.trngSeqLen);
fprintf('  Total burst length: %d bits\n\n', waveform.burstBlockLen);

% Prepare payload (pad or truncate to required size)
payloadBytes = csvData.bytes(:);
if length(payloadBytes) < waveform.pldLenInfBytes
    % Pad with zeros
    payloadBytes = [payloadBytes; zeros(waveform.pldLenInfBytes - length(payloadBytes), 1, 'uint8')];
elseif length(payloadBytes) > waveform.pldLenInfBytes
    % Truncate
    payloadBytes = payloadBytes(1:waveform.pldLenInfBytes);
end

fprintf('Payload prepared: %d bytes\n\n', length(payloadBytes));

%% TX Chain Setup
encoder = convEncoder('constraintLength', 7, 'generatorPolynomials', [171 133]);
gaussFilt = GaussianFilter('BT', BT, 'SPS', SPS, 'spanSymbols', 8);
gmskMod = GmskMapper('lutSize', 512, 'accBits', 16, 'bitGainReduct', 8);

%% RX Chain Setup
rxDemod = RxDemodulator('samplesPerSymbol', SPS, 'gaussSpanSymbols', 8);
vitDecoder = ViterbiDecoder('constraintLength', 7, 'generatorOctal', [171 133], ...
                            'tracebackLen', 35, 'inputType', "soft_llr", ...
                            'mode', "trunc");

%% Build Packet
burstBits = build_packet(payloadBytes, waveform, encoder);

%% Modulate
filteredBits = gaussFilt(burstBits);
txSignal = gmskMod(filteredBits);
fprintf('TX signal: %d samples\n\n', length(txSignal));

%% Channel - Add AWGN
codedRate = waveform.pldLenInfBytes * 8 / waveform.pldLenEncBits;
EbN0_linear = 10^(EbN0_dB/10);
SNR_linear = EbN0_linear * codedRate * (1/SPS);

signalPower = var(txSignal);
noisePower = signalPower / SNR_linear;

noise = sqrt(noisePower/2) * (randn(size(txSignal)) + 1j*randn(size(txSignal)));
rxSignal = txSignal + noise;

fprintf('Channel:\n');
fprintf('  Signal Power: %.2f\n', signalPower);
fprintf('  Noise Power: %.2f\n', noisePower);
fprintf('  SNR: %.2f dB\n', 10*log10(signalPower/noisePower));
fprintf('  Eb/N0: %.2f dB\n\n', EbN0_dB);

%% Demodulate to LLRs
vitDecoder.nVar = noisePower * SPS;
llrs = rxDemod(rxSignal);
fprintf('Demodulated to %d LLRs\n', length(llrs));



%% Detect Preamble
[preambleIdx, corrPeak, corrSignal] = detect_preamble(llrs, waveform.prmbSeq, PREAMBLE_THRESHOLD);

if preambleIdx == 0
    error('Preamble not detected! Try lowering threshold or increasing SNR.');
end

%% Extract Burst Starting from Preamble
burstStartIdx = preambleIdx;
burstEndIdx = min(burstStartIdx + waveform.burstBlockLen - 1, length(llrs));


% Also extract corresponding LLRs
llrBurst = llrs(burstStartIdx:burstEndIdx);

%% Extract Payload from Burst
payloadEncoded = extract_payload(llrBurst, waveform);


%% Decode Payload
decodedBits = vitDecoder(payloadEncoded);

% Remove traceback delay
tracebackDelay = vitDecoder.tracebackLen;
% if length(decodedBits) > tracebackDelay
%     decodedBits = decodedBits(tracebackDelay+1:end);
% end

% Truncate to expected info bit length
expectedInfoBits = waveform.pldLenInfBytes * 8;
decodedBits = decodedBits(1:min(expectedInfoBits, length(decodedBits)));

fprintf('Decoded %d information bits\n', length(decodedBits));

%% Convert Bits to Bytes
numDecodedBytes = floor(length(decodedBits) / 8);
decodedBytes = zeros(numDecodedBytes, 1, 'uint8');

for i = 1:numDecodedBytes
    bitIdx = (i-1)*8 + 1;
    byteBits = decodedBits(bitIdx:bitIdx+7);
    % Convert MSB-first bits to byte
    decodedBytes(i) = uint8(0);
    for b = 1:8
        if byteBits(b)
            decodedBytes(i) = bitor(decodedBytes(i), bitshift(uint8(1), 8-b));
        end
    end
end

fprintf('Converted to %d bytes\n\n', length(decodedBytes));

%% Calculate Byte Error Rate
numCompareBytes = min(length(payloadBytes), length(decodedBytes));
byteErrors = sum(payloadBytes(1:numCompareBytes) ~= decodedBytes(1:numCompareBytes));
ber = byteErrors / numCompareBytes;

fprintf('=== RESULTS ===\n');
fprintf('Transmitted bytes: %d\n', length(payloadBytes));
fprintf('Received bytes: %d\n', length(decodedBytes));
fprintf('Byte Error Rate: %.4f (%d errors in %d bytes)\n', ber, byteErrors, numCompareBytes);

% Bit-level comparison
if length(decodedBits) >= expectedInfoBits
    infoBitsOrig = false(expectedInfoBits, 1);
    k = 1;
    for b = payloadBytes(1:waveform.pldLenInfBytes)'
        infoBitsOrig(k:k+7) = logical(bitget(uint8(b), 8:-1:1));
        k = k + 8;
    end
    bitErrors = sum(infoBitsOrig ~= decodedBits(1:expectedInfoBits));
    bitBER = bitErrors / expectedInfoBits;
    fprintf('Bit Error Rate: %.4f (%d errors in %d bits)\n', bitBER, bitErrors, expectedInfoBits);
end

%% Write Output CSV
write_axi_stream_csv(csvOutputFile, decodedBytes);
fprintf('\n=== Wrote recovered data to: %s ===\n', csvOutputFile);

%% Diagnostic Plots
figure('Position', [50 50 1400 900]);

% Plot 1: TX Signal
subplot(3,3,1);
plot(real(txSignal(1:500)));
title('TX Signal (Real)');
xlabel('Sample'); ylabel('Amplitude');
grid on;

% Plot 2: RX Signal
subplot(3,3,2);
plot(real(rxSignal(1:500)));
title('RX Signal with Noise (Real)');
xlabel('Sample'); ylabel('Amplitude');
grid on;

% Plot 3: Constellation
subplot(3,3,3);
plot(real(rxSignal), imag(rxSignal), '.', 'MarkerSize', 2);
title('RX Constellation');
xlabel('I'); ylabel('Q');
grid on; axis equal;

% Plot 4: Preamble Correlation
subplot(3,3,4);
plot(corrSignal);
hold on;
if preambleIdx > 0
    plot(preambleIdx, corrPeak, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
end
yline(PREAMBLE_THRESHOLD, 'r--', 'Threshold');
hold off;
title(sprintf('Preamble Detection (Peak: %.3f at idx %d)', corrPeak, preambleIdx));
xlabel('Bit Index'); ylabel('Correlation');
grid on;

% Plot 5: Received Bits
subplot(3,3,5);
plot(llrs(1:min(500, length(llrs))));
title('Received LLRs');
xlabel('Bit Index'); ylabel('LLR Value');
grid on; ylim([-5 5]);

% Plot 6: LLR Distribution
subplot(3,3,6);
histogram(llrs, 50);
title('LLR Distribution');
xlabel('LLR Value'); ylabel('Count');
grid on;

% Plot 7: Extracted Payload LLRs
subplot(3,3,7);
if ~isempty(payloadEncoded)
    plot(payloadEncoded(1:min(200, length(payloadEncoded))));
    title('Extracted Payload Encoded Bits');
    xlabel('Bit Index'); ylabel('Encoded Bit Value');
    grid on;
end

% Plot 8: Byte Comparison
subplot(3,3,8);
if numCompareBytes >= 20
    compareN = min(20, numCompareBytes);
    x = 1:compareN;
    bar(x, [double(payloadBytes(1:compareN)), double(decodedBytes(1:compareN))]);
    legend('TX', 'RX');
    title(sprintf('Byte Comparison (BER=%.4f)', ber));
    xlabel('Byte Index'); ylabel('Value');
    grid on;
end

% Plot 9: Error Locations
subplot(3,3,9);
if numCompareBytes > 0
    errorMask = (payloadBytes(1:numCompareBytes) ~= decodedBytes(1:numCompareBytes));
    stem(find(errorMask), ones(sum(errorMask),1), 'r', 'filled');
    title(sprintf('Error Locations (%d errors)', sum(errorMask)));
    xlabel('Byte Index'); ylabel('Error');
    grid on;
    ylim([0 1.5]);
end

sgtitle(sprintf('GMSK Packet System - Eb/N0 = %.1f dB', EbN0_dB));

fprintf('\n=== Test Complete ===\n');
