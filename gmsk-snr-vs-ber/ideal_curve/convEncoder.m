classdef convEncoder < matlab.System
% ConvEncoder — Basic rate-1/2 convolutional encoder (K=7, [171 133] octal)
    properties
        constraintLength = 7
        generatorPolynomials = [171 133] % octal polynomials
    end

    methods
        function obj = convEncoder(varargin)
            setProperties(obj, nargin, varargin{:});
        end
    end

    methods(Access = protected)
        function encodedBits = stepImpl(obj, infoBits)
            encodedBits = convEncodeBits(infoBits, ...
                obj.constraintLength, obj.generatorPolynomials);
        end
    end
end

function encodedBits = convEncodeBits(infoBits, constraintLength, generatorPolynomials)
    infoBits = uint8(infoBits(:));
    numPolys = numel(generatorPolynomials);
    polyTaps = getPolyTaps(generatorPolynomials, constraintLength);

    shiftReg = zeros(constraintLength, 1, 'uint8');
    encodedBits = zeros(numel(infoBits) * numPolys, 1, 'uint8');
    outIdx = 1;

    for idx = 1:numel(infoBits)
        shiftReg = [infoBits(idx); shiftReg(1:end-1)];
        for p = 1:numPolys
            encodedBits(outIdx) = mod(sum(shiftReg(polyTaps{p})), 2);
            outIdx = outIdx + 1;
        end
    end
end

function polyTaps = getPolyTaps(generatorPolynomials, constraintLength)
    numPolys = numel(generatorPolynomials);
    polyTaps = cell(numPolys, 1);
    for p = 1:numPolys
        polyBin = oct2poly(generatorPolynomials(p), constraintLength);
        polyTaps{p} = find(polyBin);
    end
end

function polyBin = oct2poly(polyOct, constraintLength)
    polyBin = zeros(constraintLength, 1, 'uint8');
    polyVal = base2dec(num2str(polyOct), 8);
    for i = 1:constraintLength
        polyBin(i) = bitget(polyVal, constraintLength - i + 1);
    end
end
