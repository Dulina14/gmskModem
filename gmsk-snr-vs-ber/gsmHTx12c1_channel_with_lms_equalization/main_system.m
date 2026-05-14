clc; clear; close all;

%% Files
inputFile  = 'tx_data.csv';

%% TX
[txSignal, waveform, signalPower] = tx_chain(inputFile);

%% Channel
SNR_dB = 24;
rxSignal = channel_model(txSignal, signalPower, SNR_dB);

%% RX
decodedData = rx_chain(rxSignal);

compare_payload_bytes(inputFile, 'rx_data.csv', waveform.pldLenInfBytes);

fprintf('\n=== SYSTEM COMPLETE ===\n');
