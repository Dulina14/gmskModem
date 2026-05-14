classdef RxDemodulator < matlab.System

    properties
        gdm = GmskDemapper;
        samplesPerSymbol = 4;   % must match TX SPS
        gaussSpanSymbols = 8;   % must match TX span

    end

    methods
        function obj = RxDemodulator(varargin)
            setProperties(obj, nargin, varargin{:});
        end
    end

    methods(Access=protected)
        function symMetric = stepImpl(obj, inSignal)

            % 1) Demap: dphi per sample
            dphi = obj.gdm(inSignal);

            % 2) Sample at symbol times (same as your slicer)
            sampleIdx = obj.symbolSampleIdx(numel(dphi));
            
            symMetric = dphi(sampleIdx);  % one value per symbol/bit

    
        end
    end

    methods(Access=private)
        function sampleIdx = symbolSampleIdx(obj, N)
            startIdx = obj.groupDelaySamples() + 1;

            if N < startIdx
                sampleIdx = [];
                return;
            end

            numSymbols = floor((N - startIdx) / obj.samplesPerSymbol) + 1;
            stopIdx    = N - obj.groupDelaySamples();
            sampleIdx  = startIdx + (0:numSymbols-1) * obj.samplesPerSymbol;
            sampleIdx  = sampleIdx(sampleIdx <= stopIdx);
        end

        function gd = groupDelaySamples(obj)
            % With your TX design: taps = spanSymbols*SPS + 1
            % FIR group delay = (Ntaps-1)/2 = (span*SPS)/2
            gd = floor((obj.gaussSpanSymbols * obj.samplesPerSymbol) / 2);
        end
    end
end
