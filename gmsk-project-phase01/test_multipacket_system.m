%% Multi-Packet GMSK Transceiver with CSV Input/Output
% This script demonstrates continuous multi-packet transmission:
% 1. Reading arbitrary-length data from CSV
% 2. Splitting into multiple packets
% 3. Continuous transmission with guard intervals
% 4. Multi-packet detection and recovery
% 5. Writing all recovered data to CSV

clear; clc; close all;

%% Parameters
EbN0_dB = 10;                    % SNR in dB
SPS = 256;                        % Samples per symbol
BT = 0.35;                      % Gaussian filter BT
PREAMBLE_THRESHOLD = 0.6;       % Preamble detection threshold
GUARD_BITS = 100;               % Bits between packets
MIN_PACKET_SPACING = 500;       % Minimum spacing for preamble detection

%% Create Extended Input CSV (Multiple packets worth of data)
csvInputFile = 'tx_multipacket_data.csv';
csvOutputFile = 'rx_multipacket_data.csv';


%% Read Input CSV
csvData = read_axi_stream_csv(csvInputFile);
allDataBytes = csvData.bytes(:);

fprintf('Total data from CSV: %d bytes\n', length(allDataBytes));
fprintf('At 34 bytes/packet, this requires %.1f packets\n\n', ...
    length(allDataBytes) / 34);

%% Setup Waveform Structure
waveform = Waveform('waveformId', 0);
fprintf('Waveform parameters:\n');
fprintf('  Info bytes per packet: %d\n', waveform.pldLenInfBytes);
fprintf('  Encoded bits per packet: %d\n', waveform.pldLenEncBits);
fprintf('  Total burst length: %d bits\n', waveform.burstBlockLen);
fprintf('  Preamble: %d bits, Training: %d bits\n\n', ...
    waveform.prmbSeqLen, waveform.trngSeqLen);

%% TX Chain Setup
encoder = convEncoder('constraintLength', 7, 'generatorPolynomials', [171 133]);
gaussFilt = GaussianFilter('BT', BT, 'SPS', SPS, 'spanSymbols', 8);
gmskMod = GmskMapper('lutSize', 512, 'accBits', 16, 'bitGainReduct', 8);

%% RX Chain Setup
rxDemod = RxDemodulator('samplesPerSymbol', SPS, 'gaussSpanSymbols', 8);

vitDecoder = ViterbiDecoder('constraintLength', 7, 'generatorOctal', [171 133], ...
                            'tracebackLen', 35, 'inputType', "soft_llr", ...
                            'mode', "trunc");

%% Build Multi-Packet Stream
[allPacketBits, txPacketInfo] = build_multipacket(allDataBytes, waveform, encoder, GUARD_BITS);

%% Modulate
fprintf('Modulating %d bits...\n', length(allPacketBits));
filteredBits = gaussFilt(allPacketBits);
txSignal = gmskMod(filteredBits);
fprintf('TX signal: %d samples (%.2f ms at 1 Msps)\n\n', ...
    length(txSignal), length(txSignal) * SPS / 1e3);

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

%% Demodulate to LLRs and Hard Bits

llrs = rxDemod(rxSignal);



%% Detect All Preambles
[detections, corrSignal] = detect_preamble(llrs, waveform.prmbSeq, ...
                                                PREAMBLE_THRESHOLD, MIN_PACKET_SPACING);

if isempty(detections)
    error('No preambles detected! Try lowering threshold or increasing SNR.');
end

%% Receive and Decode All Packets
[allRecoveredBytes, rxPacketResults] = receive_multipacket(llrs, ...
                                                          detections, waveform, vitDecoder);

%% Calculate Error Statistics
numTxPackets = length(txPacketInfo);
numRxPackets = sum([rxPacketResults.recovered]);

fprintf('\n=== TRANSMISSION SUMMARY ===\n');
fprintf('Transmitted: %d packets (%d bytes)\n', numTxPackets, length(allDataBytes));
fprintf('Detected: %d packets\n', length(detections));
fprintf('Recovered: %d packets (%d bytes)\n', numRxPackets, length(allRecoveredBytes));

% Calculate per-packet and overall error rates
successfulPackets = 0;
totalByteErrors = 0;
totalBitErrors = 0;

fprintf('\n=== PER-PACKET RESULTS ===\n');
for i = 1:min(numTxPackets, length(rxPacketResults))
    if rxPacketResults(i).recovered
        % Compare with transmitted data
        txBytes = txPacketInfo(i).dataBytes;
        rxBytes = rxPacketResults(i).dataBytes;
        
        numCompareBytes = min(length(txBytes), length(rxBytes));
        byteErrors = sum(txBytes(1:numCompareBytes) ~= rxBytes(1:numCompareBytes));
        
        % Calculate bit errors
        bitErrors = 0;
        for b = 1:numCompareBytes
            bitErrors = bitErrors + sum(bitget(txBytes(b), 1:8) ~= bitget(rxBytes(b), 1:8));
        end
        
        totalByteErrors = totalByteErrors + byteErrors;
        totalBitErrors = totalBitErrors + bitErrors;
        
        if byteErrors == 0
            successfulPackets = successfulPackets + 1;
            status = 'OK';
        else
            status = sprintf('%d byte errors', byteErrors);
        end
        
        fprintf('Packet %d: %s\n', i, status);
    else
        fprintf('Packet %d: FAILED (not recovered)\n', i);
    end
end

% Overall statistics
if numRxPackets > 0
    overallBER = totalByteErrors / (numRxPackets * waveform.pldLenInfBytes);
    fprintf('\n=== OVERALL STATISTICS ===\n');
    fprintf('Packet Success Rate: %.1f%% (%d/%d)\n', ...
        100*successfulPackets/numTxPackets, successfulPackets, numTxPackets);
    fprintf('Byte Error Rate: %.4f (%d errors in %d bytes)\n', ...
        overallBER, totalByteErrors, numRxPackets * waveform.pldLenInfBytes);
    if totalBitErrors > 0
        bitBER = totalBitErrors / (numRxPackets * waveform.pldLenInfBytes * 8);
        fprintf('Bit Error Rate: %.4f (%d errors in %d bits)\n', ...
            bitBER, totalBitErrors, numRxPackets * waveform.pldLenInfBytes * 8);
    end
end

%% Write Output CSV
% For multi-packet, we may want to trim padding from last packet
% Since we know original data length
if length(allRecoveredBytes) > length(allDataBytes)
    allRecoveredBytes = allRecoveredBytes(1:length(allDataBytes));
end

write_axi_stream_csv(csvOutputFile, allRecoveredBytes);
fprintf('\n=== Wrote recovered data to: %s ===\n', csvOutputFile);

%% Verify Output Matches Input
if length(allRecoveredBytes) == length(allDataBytes)
    matchingBytes = sum(allRecoveredBytes == allDataBytes);
    fprintf('Output verification: %d/%d bytes match (%.1f%%)\n', ...
        matchingBytes, length(allDataBytes), 100*matchingBytes/length(allDataBytes));
end

%% Diagnostic Plots
figure('Position', [50 50 1600 1000]);

% Plot 1: TX Signal
subplot(3,4,1);
plotLen = min(2000, length(txSignal));
plot(real(txSignal(1:plotLen)));
title('TX Signal (Real Part)');
xlabel('Sample'); ylabel('Amplitude');
grid on;

% Plot 2: RX Signal
subplot(3,4,2);
plot(real(rxSignal(1:plotLen)));
title('RX Signal with Noise (Real)');
xlabel('Sample'); ylabel('Amplitude');
grid on;

% Plot 3: Constellation
subplot(3,4,3);
plot(real(rxSignal), imag(rxSignal), '.', 'MarkerSize', 1);
title('RX Constellation');
xlabel('I'); ylabel('Q');
grid on; axis equal;

% Plot 4: Preamble Correlation (Full)
subplot(3,4,4);
plot(corrSignal);
hold on;
for i = 1:length(detections)
    plot(detections(i).index, detections(i).correlation, ...
        'ro', 'MarkerSize', 8, 'LineWidth', 2);
end
yline(PREAMBLE_THRESHOLD, 'r--', 'Threshold');
hold off;
title(sprintf('Preamble Detection (%d found)', length(detections)));
xlabel('Bit Index'); ylabel('Correlation');
grid on;

% Plot 5: Zoom on first detection
subplot(3,4,5);
if ~isempty(detections)
    idx1 = detections(1).index;
    zoomRange = max(1, idx1-200):min(length(corrSignal), idx1+200);
    plot(zoomRange, corrSignal(zoomRange));
    hold on;
    plot(idx1, detections(1).correlation, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    hold off;
    title(sprintf('First Detection (idx %d)', idx1));
    xlabel('Bit Index'); ylabel('Correlation');
    grid on;
end

% Plot 6: LLR Distribution
subplot(3,4,6);
histogram(llrs, 50);
title('LLR Distribution');
xlabel('LLR Value'); ylabel('Count');
grid on;


% Plot 8: Packet Detection Timeline
subplot(3,4,7);
if ~isempty(detections)
    detIndices = [detections.index];
    detCorr = [detections.correlation];
    stem(detIndices, detCorr, 'filled');
    title('Detected Packets Timeline');
    xlabel('Bit Index'); ylabel('Correlation');
    grid on;
end

% Plot 9: Transmitted vs Received Bytes (first packet)
subplot(3,4,8);
if numRxPackets >= 1 && rxPacketResults(1).recovered
    compareN = min(34, length(txPacketInfo(1).dataBytes));
    x = 1:compareN;
    txVals = double(txPacketInfo(1).dataBytes(1:compareN));
    rxVals = double(rxPacketResults(1).dataBytes(1:compareN));
    plot(x, txVals, 'b-o', 'DisplayName', 'TX'); hold on;
    plot(x, rxVals, 'r--x', 'DisplayName', 'RX'); hold off;
    legend('Location', 'best');
    title('Packet 1 Bytes: TX vs RX');
    xlabel('Byte Index'); ylabel('Value');
    grid on;
end

% Plot 10: Error Locations (byte-level, all packets)
subplot(3,4,9);
if numRxPackets > 0
    allTxBytes = [];
    allRxBytes = [];
    for i = 1:min(numTxPackets, length(rxPacketResults))
        if rxPacketResults(i).recovered
            allTxBytes = [allTxBytes; txPacketInfo(i).dataBytes]; %#ok<AGROW>
            allRxBytes = [allRxBytes; rxPacketResults(i).dataBytes]; %#ok<AGROW>
        end
    end
    numCompare = min(length(allTxBytes), length(allRxBytes));
    if numCompare > 0
        errorMask = (allTxBytes(1:numCompare) ~= allRxBytes(1:numCompare));
        stem(find(errorMask), ones(sum(errorMask),1), 'r', 'filled');
        title(sprintf('Error Locations (%d errors)', sum(errorMask)));
        xlabel('Byte Index (across all packets)'); ylabel('Error');
        grid on; ylim([0 1.5]);
    end
end

% Plot 11: Per-Packet Success
subplot(3,4,10);
if ~isempty(rxPacketResults)
    packetSuccess = double([rxPacketResults.recovered]);
    bar(1:length(packetSuccess), packetSuccess);
    title('Per-Packet Recovery Success');
    xlabel('Packet Number'); ylabel('Recovered (1=yes, 0=no)');
    grid on; ylim([0 1.2]);
end

% Plot 12: Correlation values per packet
subplot(3,4,11);
if ~isempty(detections)
    bar([detections.correlation]);
    yline(PREAMBLE_THRESHOLD, 'r--', 'Threshold');
    title('Preamble Correlation Per Packet');
    xlabel('Packet Number'); ylabel('Correlation');
    grid on;
end

sgtitle(sprintf('Multi-Packet GMSK System - %d Packets, Eb/N0=%.1f dB', ...
    numTxPackets, EbN0_dB));

fprintf('\n=== Multi-Packet Test Complete ===\n');
