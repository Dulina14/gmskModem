clear; clc; close all;

%% Simulation Parameters
SNR_dB_range       = 0:1:30;  % Tighter range — curve dies before 15 dB
BT                 = 0.35;
PREAMBLE_THRESHOLD = 0.15;
SPS                = 4;
TB_LEN             = 32;

numTrials          = 100;        % More trials → reliable BER at the steep drop

ZERO_BER_LIMIT     = 3;          % Stop after this many consecutive zero-error points

v = 0*1e3/3600;
fc = 1.8e9;
fd = v*fc/physconst('lightspeed');

Rsym = 270.833e3;
Rsamp = SPS * Rsym;
gsmChan =stdchan('gsmHTx12c1', Rsamp, fd);


% Read Input CSV File
csvInputFile  = 'tx_data.csv';
csvData = read_axi_stream_csv(csvInputFile);
fprintf('Read %d bytes from CSV\n', length(csvData.bytes));

csvOutputFile = 'rx_data.csv';


%% Setup Waveform Structure
waveform = Waveform('waveformId', 0);
fprintf('Waveform structure:\n');
fprintf('  Preamble length: %d bits\n',          waveform.prmbSeqLen);
fprintf('  Payload length (encoded): %d bits\n', waveform.pldLenEncBits);
fprintf('  Training seq length: %d bits\n',      waveform.trngSeqLen);
fprintf('  Total burst length: %d bits\n\n',     waveform.burstBlockLen);

% Prepare payload
payloadBytes = csvData.bytes(:);
if length(payloadBytes) < waveform.pldLenInfBytes
    payloadBytes = [payloadBytes; zeros(waveform.pldLenInfBytes - length(payloadBytes), 1, 'uint8')];
elseif length(payloadBytes) > waveform.pldLenInfBytes
    payloadBytes = payloadBytes(1:waveform.pldLenInfBytes);
end

% Convert payload to bits for comparison
expectedInfoBits = waveform.pldLenInfBytes * 8;
infoBitsOrig = false(expectedInfoBits, 1);
k = 1;
for b = payloadBytes(1:waveform.pldLenInfBytes)'
    infoBitsOrig(k:k+7) = logical(bitget(uint8(b), 8:-1:1));
    k = k + 8;
end

%% TX Chain Setup
encoder   = convEncoder('constraintLength', 7, 'generatorPolynomials', [171 133]);
gaussFilt = GaussianFilter('BT', BT, 'SPS', SPS, 'spanSymbols', 8);
gmskMod   = GmskMapper('lutSize', 512, 'accBits', 16, 'bitGainReduct', 8);

%% RX Chain Setup
rxDemod = RxDemodulator('samplesPerSymbol', SPS, 'gaussSpanSymbols', 8);

%% Build Packet & Modulate (done once)
burstBits    = build_packet(payloadBytes, waveform, encoder);
filteredBits = gaussFilt(burstBits);
txSignal     = gmskMod(filteredBits);
fprintf('TX signal: %d samples\n\n', length(txSignal));

signalPower = var(txSignal);

%% Initialize results storage
BER_results   = nan(length(SNR_dB_range), 1);  % NaN = not simulated
zeroBERcount  = 0;

fprintf('Starting SNR vs BER simulation...\n');
fprintf('SNR range: %.1f to %.1f dB\n', min(SNR_dB_range), max(SNR_dB_range));
fprintf('Trials per point: %d\n\n', numTrials);

MAX_BITS   = 2e6;     % max bits per SNR point
MIN_ERRORS = 100;     % required errors for reliability


for idx = 1:length(SNR_dB_range)
    SNR_dB = SNR_dB_range(idx);

    SNR_linear = 10^(SNR_dB / 10);
    noisePower = signalPower / SNR_linear;

    totalBitErrors = 0;
    totalBits      = 0;

    % while (totalBitErrors < MIN_ERRORS) && (totalBits < MAX_BITS)
    for trial = 1:numTrials
        reset(gsmChan);

        % Send through channel
        fadedSignal = gsmChan(txSignal);

        % Normalize power
        fadedSignal = fadedSignal / rms(fadedSignal) * sqrt(signalPower);

        % Add AWGN
        noise    = sqrt(noisePower/2) * (randn(size(fadedSignal)) + 1j*randn(size(fadedSignal)));
        rxSignal = fadedSignal + noise;
                
        % Demodulate
        llrs = rxDemod(rxSignal);

        % Detect Preamble
        [detections, ~] = detect_preamble(llrs, waveform.prmbSeq, PREAMBLE_THRESHOLD, 500, false);

        if isempty(detections)
            totalBitErrors = totalBitErrors + expectedInfoBits;
            totalBits      = totalBits      + expectedInfoBits;
            continue;
        end

        % Extract burst
        burstStartIdx = detections(1).index;
        burstEndIdx   = min(burstStartIdx + waveform.burstBlockLen - 1, length(llrs));
        llrBurst      = llrs(burstStartIdx:burstEndIdx);

        if length(llrBurst) < waveform.burstBlockLen
            totalBitErrors = totalBitErrors + expectedInfoBits;
            totalBits      = totalBits      + expectedInfoBits;
            continue;
        end

        % Decode
        payloadEncoded = extract_payload(llrBurst, waveform, false);
        decodedBits    = viterbi_soft_decoder(payloadEncoded, TB_LEN);
        decodedBits    = decodedBits(1:min(expectedInfoBits, length(decodedBits)));

        bitErrors      = sum(infoBitsOrig(1:length(decodedBits)) ~= decodedBits);

        totalBitErrors = totalBitErrors + bitErrors;
        totalBits      = totalBits      + length(decodedBits);
    end

    BER_results(idx) = totalBitErrors / totalBits;

    fprintf('SNR = %2d dB | BER = %.3e | Bits = %.0f | Errors = %d\n', ...
        SNR_dB, BER_results(idx), totalBits, totalBitErrors);
end

figure;
semilogy(SNR_dB_range, BER_results, 'o-', 'LineWidth', 2);
grid on;

ylim([1e-6 1]);
yticks([1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1]);

xlabel('SNR (dB)');
ylabel('BER');
title('SNR vs BER');

hold on;
yline(1e-5, '--r', 'Target BER = 10^{-5}');

TARGET_BER = 1e-5;

idx_cross = find(BER_results <= TARGET_BER, 1, 'first');

if ~isempty(idx_cross)
    fprintf('\n✅ BER crosses 1e-5 at approximately SNR = %.2f dB\n', ...
        SNR_dB_range(idx_cross));
else
    fprintf('\n❌ BER did NOT reach 1e-5 in this SNR range\n');
end

