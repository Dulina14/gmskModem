function write_axi_stream_csv(filename, dataBytes)
% WRITE_AXI_STREAM_CSV  Write bytes to CSV in AXI4-Stream format
%
% Inputs:
%   filename  : output CSV filename
%   dataBytes : uint8 vector of data bytes to write
%
% Output format: TDATA,TKEEP,TLAST
%   - Packs 4 bytes per row (32-bit words)
%   - Sets TKEEP based on valid bytes
%   - Sets TLAST=1 on final row

    dataBytes = uint8(dataBytes(:));
    numBytes = length(dataBytes);
    
    % Calculate number of rows needed (4 bytes per row)
    numRows = ceil(numBytes / 4);
    
    % Prepare output arrays
    tdata = strings(numRows, 1);
    tkeep = strings(numRows, 1);
    tlast = zeros(numRows, 1);
    
    byteIdx = 1;
    
    for row = 1:numRows
        % Determine how many bytes in this row
        bytesInRow = min(4, numBytes - byteIdx + 1);
        
        % Extract bytes for this row (pad with zeros if needed)
        rowBytes = zeros(1, 4, 'uint8');
        rowBytes(1:bytesInRow) = dataBytes(byteIdx:byteIdx+bytesInRow-1);
        byteIdx = byteIdx + bytesInRow;
        
        % Pack into 32-bit word (big-endian: first byte is MSB)
        % rowBytes = [b3, b2, b1, b0] where b3 is MSB
        word = uint32(rowBytes(1)) * 2^24 + ...
               uint32(rowBytes(2)) * 2^16 + ...
               uint32(rowBytes(3)) * 2^8 + ...
               uint32(rowBytes(4));
        
        % Convert to hex string (8 characters, uppercase)
        tdata(row) = upper(dec2hex(word, 8));
        
        % Set TKEEP based on valid bytes
        % TKEEP bit 0 -> byte 0 (LSB), bit 3 -> byte 3 (MSB)
        % We have bytesInRow valid bytes from MSB side
        keepMask = 0;
        for b = 1:bytesInRow
            keepMask = bitor(keepMask, bitshift(1, 4-b));
        end
        tkeep(row) = lower(dec2hex(keepMask, 1));
        
        % Set TLAST on final row
        if row == numRows
            tlast(row) = 1;
        end
    end
    
    % Create table and write to CSV
    T = table(tdata, tkeep, tlast, 'VariableNames', {'TDATA', 'TKEEP', 'TLAST'});
    writetable(T, filename);
    
    fprintf('Wrote %d bytes (%d rows) to %s\n', numBytes, numRows, filename);
end
