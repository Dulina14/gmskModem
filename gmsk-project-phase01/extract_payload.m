function payloadBits = extract_payload(burstBits, waveform)
% EXTRACT_PAYLOAD  Extract payload bits from received burst
%
% Inputs:
%   burstBits : uint8 vector of complete burst (after preamble detection)
%   waveform  : Waveform object containing packet structure
%
% Output:
%   payloadBits : uint8 vector of encoded payload bits (to be decoded)
%
% This function extracts the 4 interleaved payload chunks from the burst

    if length(burstBits) < waveform.burstBlockLen
        error('Burst too short: expected %d bits, got %d', waveform.burstBlockLen, length(burstBits));
    end
    
    % Initialize payload extraction
    payloadBits = zeros(waveform.pldLenEncBits, 1, 'like', burstBits);
    
    % Skip preamble
    idx = waveform.prmbSeqLen + 1;
    
    % Extract 4 payload chunks (skip training sequences)
    chunkSize = waveform.pldLenEncBits / 4;
    trainChunkSize = waveform.trngSeqLen / 4;
    
    payloadIdx = 1;
    
    for chunk = 1:4
        % Extract payload chunk
        payloadBits(payloadIdx:payloadIdx+chunkSize-1) = burstBits(idx:idx+chunkSize-1);
        idx = idx + chunkSize;
        payloadIdx = payloadIdx + chunkSize;
        
        % Skip training chunk
        idx = idx + trainChunkSize;
    end
    
    fprintf('Extracted %d payload bits from burst\n', length(payloadBits));
end
