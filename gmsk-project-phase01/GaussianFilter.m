classdef GaussianFilter < matlab.System
    properties
        BT = 0.35
        SPS = 4
        spanSymbols = 8
        gainAdj = 0
    end
    
    properties(GetAccess=public, SetAccess=private, Nontunable)
        tapsQ15
        gainQ15
    end
    
    properties(Access=private)
        firFilt
    end

    methods
        function obj = GaussianFilter(varargin)
            setProperties(obj, nargin, varargin{:});
        end
    end

    methods(Access=protected)
        function setupImpl(obj)
            [h, gq] = obj.genCoeffs(obj.BT, obj.SPS, obj.spanSymbols);
            obj.tapsQ15 = int16(obj.quantizeQ15(h));
            obj.gainQ15 = gq;
            obj.firFilt = dsp.FIRFilter('Numerator', obj.tapsQ15);
        end
        
        function burst = stepImpl(obj, bitVector)
            bitUsmpld = double(repelem(bitVector, obj.SPS));
            mapdSymb = bitUsmpld * 2 - 1;
            bitFiltrd = conv(mapdSymb, double(obj.tapsQ15), 'full');
            bitFiltrd = bitFiltrd / (2^obj.gainAdj);
            burst = GaussianFilter.sat16(bitFiltrd);
        end
    end

    methods(Static, Access=private)
        function [h, gq] = genCoeffs(BT, sps, spanSym)
            T = 1; 
            tspan = 0.5 * spanSym * T; 
            t = (-tspan : T/sps : tspan);
            h = BT * sqrt((2*pi) / log(2)) .* exp(-((2*pi^2) * (BT^2)) .* (t.^2) / log(2));
            h = h / sum(h);  % unit DC gain
            gq = int16(32767);  % unity gain in Q15
        end
        
        function q = quantizeQ15(h)
            q = int16(max(min(round(h * 32767), 32767), -32768));
        end
        
        function y16 = sat16(x32)
            y16 = int16(max(min(int32(x32), int32(32767)), int32(-32768)));
        end
    end

    methods
        function taps = getQuantizedTaps(obj)
            taps = obj.tapsQ15;
        end
        
        function g = getQuantizedGain(obj)
            g = obj.gainQ15;
        end
    end
end
