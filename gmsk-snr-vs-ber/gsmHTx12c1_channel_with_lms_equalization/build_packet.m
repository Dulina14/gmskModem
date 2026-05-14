function burstBits = build_packet(payloadBytes, waveform, encoder)
% BUILD_PACKET  Construct a complete burst with preamble, encoded payload, and training sequences
%
% Inputs:
%   payloadBytes : uint8 vector of data bytes (should be waveform.pldLenInfBytes long)
%   waveform     : Waveform object containing packet structure
%   encoder      : convEncoder object for FEC encoding
%
% Output:
%   burstBits    : uint8 vector of complete burst bits
%
% Packet structure:
%   [Preamble | Payload_chunk1 | Training1 | Payload_chunk2 | Training2 |  Payload_chunk3 | Training3 | Payload_chunk4 | Training4]

    % Validate input size
    if length(payloadBytes) ~= waveform.pldLenInfBytes
        error('Payload must be %d bytes, got %d', ...
            waveform.pldLenInfBytes, length(payloadBytes));
    end

    % Convert bytes to bits (MSB first)
    numBits = length(payloadBytes) * 8;
    infoBits = false(numBits, 1);
    k = 1;
    for b = payloadBytes(:)'
        infoBits(k:k+7) = logical(bitget(uint8(b), 8:-1:1));
        k = k + 8;
    end
    
    % Encode payload
    encodedBits = encoder(uint8(infoBits));
    
    % Verify encoded length
    if length(encodedBits) ~= waveform.pldLenEncBits
        warning('Expected %d encoded bits, got %d. Adjusting...', ...
            waveform.pldLenEncBits, length(encodedBits));
        if length(encodedBits) > waveform.pldLenEncBits
            encodedBits = encodedBits(1:waveform.pldLenEncBits);
        else
            encodedBits = [encodedBits; zeros(waveform.pldLenEncBits - length(encodedBits), 1, 'uint8')];
        end
    end
    
    % Build interleaved packet structure
    % Total: preamble + 4*(payload_chunk + training_chunk)
    burstBits = zeros(waveform.burstBlockLen, 1, 'uint8');
    
    % Insert preamble
    idx = 1;
    burstBits(idx:idx+waveform.prmbSeqLen-1) = waveform.prmbSeq(:);
    idx = idx + waveform.prmbSeqLen;
    
    % Split payload into 4 chunks and interleave with training sequences
    chunkSize = waveform.pldLenEncBits / 4;
    trainChunkSize = waveform.trngSeqLen / 4;
    
    payloadIdx = 1;
    trainIdx = 1;
    
    for chunk = 1:4
        % Insert payload chunk
        burstBits(idx:idx+chunkSize-1) = encodedBits(payloadIdx:payloadIdx+chunkSize-1);
        idx = idx + chunkSize;
        payloadIdx = payloadIdx + chunkSize;
        
        % Insert training chunk
        burstBits(idx:idx+trainChunkSize-1) = waveform.trngSeq(trainIdx:trainIdx+trainChunkSize-1);
        idx = idx + trainChunkSize;
        trainIdx = trainIdx + trainChunkSize;
    end
    
end
