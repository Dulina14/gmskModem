function bytes = bits_to_bytes(bits)
% BITS_TO_BYTES  Convert bit vector to byte vector
%
% Input:
%   bits : logical or uint8 vector (length must be multiple of 8)
%
% Output:
%   bytes : uint8 vector
%
% Bits are assumed to be in MSB-first order:
%   bits [b7 b6 b5 b4 b3 b2 b1 b0] → byte value

    bits = uint8(bits(:));
    
    % Check length is multiple of 8
    if mod(length(bits), 8) ~= 0
        warning('Bit length not multiple of 8, truncating...');
        bits = bits(1:floor(length(bits)/8)*8);
    end
    
    numBytes = length(bits) / 8;
    bytes = zeros(numBytes, 1, 'uint8');
    
    for i = 1:numBytes
        bitIdx = (i-1) * 8 + 1;
        byteBits = bits(bitIdx:bitIdx+7);
        
        % Convert MSB-first bits to byte value
        byteVal = uint8(0);
        for b = 1:8
            if byteBits(b)
                byteVal = bitor(byteVal, bitshift(uint8(1), 8-b));
            end
        end
        
        bytes(i) = byteVal;
    end
end
