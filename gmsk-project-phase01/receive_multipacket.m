function [allRecoveredBytes, packetResults] = receive_multipacket(rxLLRs, detections, waveform, vitDecoder)
% RECEIVE_MULTIPACKET  Extract and decode all detected packets
%
% Inputs:
%   rxBits      : uint8 vector of hard-decision received bits
%   rxLLRs      : double vector of soft LLRs (same length as rxBits)
%   detections  : struct array from detect_all_preambles
%   waveform    : Waveform object
%   vitDecoder  : ViterbiDecoder object
%
% Outputs:
%   allRecoveredBytes : uint8 vector of all recovered data bytes concatenated
%   packetResults     : struct array with per-packet results
%                       .packetNum - packet number
%                       .recovered - true if successfully extracted
%                       .dataBytes - recovered data bytes
%                       .bitErrors - number of bit errors (if known)

    numDetected = length(detections);
    
    fprintf('=== Receiving Multi-Packet Stream ===\n');
    fprintf('Processing %d detected packets...\n\n', numDetected);
    
    % Initialize outputs
    allRecoveredBytes = uint8([]);
    packetResults = struct('packetNum', {}, 'recovered', {}, ...
                          'dataBytes', {}, 'bitErrors', {});
    
    for i = 1:numDetected
        pktNum = detections(i).packetNum;
        preambleIdx = detections(i).index;
        
        fprintf('Packet %d (preamble at %d):\n', pktNum, preambleIdx);
        
        % Check if we have enough bits for full packet
        burstStartIdx = preambleIdx;
        burstEndIdx = burstStartIdx + waveform.burstBlockLen - 1;
        
        if burstEndIdx > length(rxLLRs)
            fprintf('  WARNING: Incomplete packet (need %d bits, have %d)\n', ...
                waveform.burstBlockLen, length(rxLLRs) - burstStartIdx + 1);
            packetResults(i).packetNum = pktNum;
            packetResults(i).recovered = false;
            packetResults(i).dataBytes = uint8([]);
            packetResults(i).bitErrors = NaN;
            continue;
        end
        
        % Extract burst (LLRs)
        llrBurst = rxLLRs(burstStartIdx:burstEndIdx);
        
        % Extract payload LLRs from burst structure
        llrPayload = zeros(waveform.pldLenEncBits, 1);
        idx = waveform.prmbSeqLen + 1;  % Skip preamble
        chunkSize = waveform.pldLenEncBits / 4;
        trainChunkSize = waveform.trngSeqLen / 4;
        payloadIdx = 1;
        
        for chunk = 1:4
            llrPayload(payloadIdx:payloadIdx+chunkSize-1) = ...
                llrBurst(idx:idx+chunkSize-1);
            idx = idx + chunkSize;
            payloadIdx = payloadIdx + chunkSize;
            
            % Skip training chunk
            idx = idx + trainChunkSize;
        end
        
        % Viterbi decode
        decodedBits = vitDecoder(llrPayload);
        
        % Remove traceback delay
        % tracebackDelay = vitDecoder.tracebackLen;
        % if length(decodedBits) > tracebackDelay
        %     decodedBits = decodedBits(tracebackDelay+1:end);
        % end
        
        % Truncate to expected info bit length
        expectedInfoBits = waveform.pldLenInfBytes * 8;
        if length(decodedBits) > expectedInfoBits
            decodedBits = decodedBits(1:expectedInfoBits);
        elseif length(decodedBits) < expectedInfoBits
            fprintf('  WARNING: Decoded bits too short (%d < %d)\n', ...
                length(decodedBits), expectedInfoBits);
            decodedBits = [decodedBits; zeros(expectedInfoBits - length(decodedBits), 1, 'uint8')];
        end
        
        % Convert bits to bytes
        decodedBytes = bits_to_bytes(decodedBits);
        
        fprintf('  Recovered %d bytes\n', length(decodedBytes));
        
        % Store results
        packetResults(i).packetNum = pktNum;
        packetResults(i).recovered = true;
        packetResults(i).dataBytes = decodedBytes;
        packetResults(i).bitErrors = NaN;  % Unknown without ground truth
        
        % Append to overall output
        allRecoveredBytes = [allRecoveredBytes; decodedBytes]; %#ok<AGROW>
    end
    
    fprintf('\nTotal recovered: %d bytes from %d packets\n', ...
        length(allRecoveredBytes), sum([packetResults.recovered]));
    fprintf('======================================\n\n');
end
