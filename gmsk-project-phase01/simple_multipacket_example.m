%% Simple Multi-Packet Usage Example
% Shows how to transmit/receive any CSV file using multi-packet system

clear; clc;

%% Parameters
EbN0_dB = 20;                    % Adjust based on desired quality
PREAMBLE_THRESHOLD = 0.6;       % Lower = more sensitive
INPUT_CSV = 'tx_multipacket_data.csv';    % Your input CSV file
OUTPUT_CSV = 'recovered_data.csv';

%% Setup System Components
fprintf('Setting up GMSK system...\n');
waveform = Waveform('waveformId', 0);
encoder = convEncoder('constraintLength', 7, 'generatorPolynomials', [171 133]);
gaussFilt = GaussianFilter('BT', 0.35, 'SPS', 4, 'spanSymbols', 8);
gmskMod = GmskMapper();
rxDemod = RxDemodulator('samplesPerSymbol', 4);
vitDecoder = ViterbiDecoder('tracebackLen', 35, 'inputType', "soft_llr");

%% Read Input Data
% For this example, create a sample file if it doesn't exist
if ~isfile(INPUT_CSV)
    fprintf('Creating sample input file: %s\n', INPUT_CSV);
    fid = fopen(INPUT_CSV, 'w');
    fprintf(fid, 'TDATA,TKEEP,TLAST\n');
    % Create 5 packets worth of random data (170 bytes)
    for i = 1:42
        if i < 42
            fprintf(fid, '%08X,f,0\n', randi([0 2^32-1]));
        else
            fprintf(fid, '%08X,3,1\n', randi([0 2^32-1]));
        end
    end
    fclose(fid);
end

csvData = read_axi_stream_csv(INPUT_CSV);
inputBytes = csvData.bytes;
fprintf('Read %d bytes from %s\n', length(inputBytes), INPUT_CSV);
fprintf('This will require %d packets\n\n', ceil(length(inputBytes)/34));

%% TRANSMIT - Build and Modulate Multi-Packet Stream
fprintf('TRANSMIT:\n');
[allPacketBits, txPacketInfo] = build_multipacket(inputBytes, waveform, encoder, 100);
filteredBits = gaussFilt(allPacketBits);
txSignal = gmskMod(filteredBits);
fprintf('Modulated to %d samples\n\n', length(txSignal));

%% CHANNEL - Add Noise
codedRate = 0.5;
EbN0_linear = 10^(EbN0_dB/10);
SNR_linear = EbN0_linear * codedRate * 0.25;
noisePower = var(txSignal) / SNR_linear;
noise = sqrt(noisePower/2) * (randn(size(txSignal)) + 1j*randn(size(txSignal)));
rxSignal = txSignal + noise;
fprintf('CHANNEL: Eb/N0 = %.1f dB\n\n', EbN0_dB);

%% RECEIVE - Demodulate and Detect Packets
fprintf('RECEIVE:\n');

llrs = rxDemod(rxSignal);

% Detect all preambles
[detections, ~] = detect_preamble(llrs, waveform.prmbSeq, ...
                                      PREAMBLE_THRESHOLD, 500);

if isempty(detections)
    error('No packets detected! Try lowering threshold or increasing Eb/N0');
end

% Decode all packets
[outputBytes, rxPacketResults] = receive_multipacket(llrs, ...
                                                    detections, waveform, vitDecoder);

%% Write Output and Calculate Statistics
% Trim to original length (remove padding)
if length(outputBytes) > length(inputBytes)
    outputBytes = outputBytes(1:length(inputBytes));
end

write_axi_stream_csv(OUTPUT_CSV, outputBytes);

% Statistics
numTxPackets = length(txPacketInfo);
numRxPackets = sum([rxPacketResults.recovered]);
numBytes = min(length(inputBytes), length(outputBytes));
byteErrors = sum(inputBytes(1:numBytes) ~= outputBytes(1:numBytes));

fprintf('\n========== RESULTS ==========\n');
fprintf('TX Packets: %d (%d bytes)\n', numTxPackets, length(inputBytes));
fprintf('RX Packets: %d (%d bytes)\n', numRxPackets, length(outputBytes));
fprintf('Packet Success Rate: %.1f%%\n', 100*numRxPackets/numTxPackets);
fprintf('Byte Errors: %d / %d (%.2f%%)\n', byteErrors, numBytes, 100*byteErrors/numBytes);
fprintf('Output written to: %s\n', OUTPUT_CSV);
fprintf('=============================\n');

% Plot overview
figure('Position', [100 100 1200 600]);

subplot(2,3,1);
plot(real(txSignal(1:min(1000,end))));
title('TX Signal'); xlabel('Sample'); grid on;

subplot(2,3,2);
plot(real(rxSignal(1:min(1000,end))));
title('RX Signal'); xlabel('Sample'); grid on;

subplot(2,3,3);
stem([detections.correlation], 'filled');
yline(PREAMBLE_THRESHOLD, 'r--');
title(sprintf('%d Packets Detected', length(detections)));
xlabel('Packet #'); ylabel('Correlation'); grid on;

subplot(2,3,4);
if numRxPackets > 0
    bar([rxPacketResults.recovered]);
    title('Packet Recovery'); xlabel('Packet #'); 
    ylabel('Success'); grid on;
end

subplot(2,3,5);
if numBytes > 0
    compareN = min(100, numBytes);
    plot(1:compareN, inputBytes(1:compareN), 'b-o'); hold on;
    plot(1:compareN, outputBytes(1:compareN), 'r--x'); hold off;
    legend('TX', 'RX');
    title('Byte Comparison (first 100)');
    xlabel('Byte Index'); grid on;
end

subplot(2,3,6);
if numBytes > 0
    errorLocs = find(inputBytes(1:numBytes) ~= outputBytes(1:numBytes));
    stem(errorLocs, ones(length(errorLocs),1), 'r', 'filled');
    title(sprintf('%d Byte Errors', length(errorLocs)));
    xlabel('Byte Index'); ylabel('Error'); grid on;
end

sgtitle(sprintf('Multi-Packet System: %d packets, Eb/N0=%.1f dB', ...
    numTxPackets, EbN0_dB));
