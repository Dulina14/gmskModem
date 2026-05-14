function [txSignal, waveform, signalPower] = tx_chain(csvInputFile)

%% Parameters (TX only)
SPS = 4;
BT  = 0.35;

%% Read input
csvData = read_axi_stream_csv(csvInputFile);

%% Waveform
waveform = Waveform('waveformId', 0);

% Prepare payload
payloadBytes = csvData.bytes(:);
if length(payloadBytes) < waveform.pldLenInfBytes
    payloadBytes = [payloadBytes; ...
        zeros(waveform.pldLenInfBytes - length(payloadBytes),1,'uint8')];
else
    payloadBytes = payloadBytes(1:waveform.pldLenInfBytes);
end

%% TX blocks
encoder   = convEncoder('constraintLength',7,'generatorPolynomials',[171 133]);
gaussFilt = GaussianFilter('BT',BT,'SPS',SPS,'spanSymbols',8);
gmskMod   = GmskMapper('lutSize',512,'accBits',16,'bitGainReduct',8);

%% Build burst
burstBits = build_packet(payloadBytes, waveform, encoder);

%% Modulate
filteredBits = gaussFilt(burstBits);
txSignal     = gmskMod(filteredBits);

%% Power
signalPower = mean(abs(txSignal).^2);

end
