function [allPacketBits, packetInfo] = build_multipacket(dataBytes, waveform, encoder, guardBits)
% BUILD_MULTIPACKET  Build multiple packets from arbitrary length data
%
% Inputs:
%   dataBytes  : uint8 vector of data bytes (any length)
%   waveform   : Waveform object containing packet structure
%   encoder    : convEncoder object for FEC encoding
%   guardBits  : number of zero bits between packets (default: 100)
%
% Outputs:
%   allPacketBits : uint8 vector of all packets concatenated with guards
%   packetInfo    : struct array with info about each packet
%                   .startIdx    - start index in allPacketBits
%                   .endIdx      - end index in allPacketBits
%                   .dataBytes   - original data bytes for this packet
%                   .packetNum   - packet number (1-based)

    if nargin < 4
        guardBits = 100;  % Default guard interval
    end

    dataBytes = uint8(dataBytes(:));
    totalBytes = length(dataBytes);
    bytesPerPacket = waveform.pldLenInfBytes;
    
    % Calculate number of packets needed
    numPackets = ceil(totalBytes / bytesPerPacket);
    
    fprintf('=== Building Multi-Packet Transmission ===\n');
    fprintf('Total data: %d bytes\n', totalBytes);
    fprintf('Bytes per packet: %d\n', bytesPerPacket);
    fprintf('Number of packets: %d\n', numPackets);
    fprintf('Guard interval: %d bits\n\n', guardBits);
    
    % Pre-allocate
    bitsPerPacket = waveform.burstBlockLen;
    totalBits = numPackets * bitsPerPacket + (numPackets - 1) * guardBits;
    allPacketBits = zeros(totalBits, 1, 'uint8');
    packetInfo = struct('startIdx', {}, 'endIdx', {}, 'dataBytes', {}, 'packetNum', {});
    
    currentBitIdx = 1;
    
    for pktNum = 1:numPackets
        % Extract data for this packet
        startByte = (pktNum - 1) * bytesPerPacket + 1;
        endByte = min(pktNum * bytesPerPacket, totalBytes);
        
        packetData = dataBytes(startByte:endByte);
        
        % Pad last packet if needed
        if length(packetData) < bytesPerPacket
            packetData = [packetData; zeros(bytesPerPacket - length(packetData), 1, 'uint8')];
            fprintf('Packet %d: bytes %d-%d (padded with %d zeros)\n', ...
                pktNum, startByte, endByte, bytesPerPacket - (endByte - startByte + 1));
        else
            fprintf('Packet %d: bytes %d-%d\n', pktNum, startByte, endByte);
        end
        
        % Build this packet
        packetBits = build_packet(packetData, waveform, encoder);
        
        % Insert into output stream
        packetStartIdx = currentBitIdx;
        packetEndIdx = currentBitIdx + bitsPerPacket - 1;
        allPacketBits(packetStartIdx:packetEndIdx) = packetBits;
        
        % Store packet info
        packetInfo(pktNum).startIdx = packetStartIdx;
        packetInfo(pktNum).endIdx = packetEndIdx;
        packetInfo(pktNum).dataBytes = packetData;
        packetInfo(pktNum).packetNum = pktNum;
        
        currentBitIdx = packetEndIdx + 1;
        
        % Add guard interval (except after last packet)
        if pktNum < numPackets
            currentBitIdx = currentBitIdx + guardBits;
        end
    end
    
    % Trim to actual size
    allPacketBits = allPacketBits(1:currentBitIdx-1);
    
    fprintf('\nTotal transmission: %d bits (%.2f sec at 1 Mbps)\n', ...
        length(allPacketBits), length(allPacketBits)/1e6);
    fprintf('===========================================\n\n');
end
