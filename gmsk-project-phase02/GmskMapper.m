classdef GmskMapper < matlab.System
    % GMSK mapper implementation using precalculated values
    properties
        lutSize = 2^9               
        accBits = 16
        bitGainReduct = 8
    end

    properties(GetAccess=public, SetAccess=private, Nontunable)
        sinLutQ15    % int16[512]
        cosLutQ15    % int16[512]
    end

    methods
        function obj = GmskMapper(varargin)
            setProperties(obj, nargin, varargin{:});
        end
    end

    methods(Access=protected)
        function setupImpl(obj)
            validateattributes(obj.lutSize, {'numeric'}, {'scalar','integer','positive'});
            [sL, cL] = obj.makeLut(obj.lutSize);
            obj.sinLutQ15 = sL;
            obj.cosLutQ15 = cL;
        end

        function burst = stepImpl(obj, filtrdBitVector)
            bv = int32(floor(double(filtrdBitVector) / (2^obj.bitGainReduct)));
            
            acc = 0;
            cx = zeros(length(bv), 1);
            
            for k = 1:length(bv)
                acc = acc + bv(k);
                if acc > (2^obj.accBits - 1)
                    acc = 2^(obj.accBits - 1);
                elseif acc < -(2^obj.accBits - 1)
                    acc = -2^(obj.accBits - 1); 
                end
                cx(k) = acc;
            end
            
            idx = mod(cx, obj.lutSize);
            I = obj.cosLutQ15(idx + 1);
            Q = obj.sinLutQ15(idx + 1);
            burst = double(I) + 1i * double(Q);
        end
    end

    methods(Static, Access=private)
        function [sL, cL] = makeLut(N)
            k = (0:N-1).';
            ang = 2 * pi * double(k) / double(N);
            s = sin(ang);
            c = cos(ang);
            sL = GmskMapper.quantizeQ15(s);
            cL = GmskMapper.quantizeQ15(c);
        end

        function q = quantizeQ15(x)
            x = max(min(x, 0.999969482421875), -1);
            q = int16(round(x * 32767));
        end
    end

    methods
        function s = getSinLut(obj)
            s = obj.sinLutQ15;
        end
        
        function c = getCosLut(obj)
            c = obj.cosLutQ15;
        end
    end
end
