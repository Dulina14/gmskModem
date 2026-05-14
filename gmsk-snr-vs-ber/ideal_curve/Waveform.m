classdef Waveform < matlab.System
    properties
        waveformId = 0
        pldLenInfBytes = 0
        P
        Q0
        Q1
        Q2
        Q3
        codeRate
        wf_crnc
        pldLenEncBits = 0
        pldBitPad = 0
        
        prmbSeqLen
        trngSeqLen   
        prmbSeq
        trngSeq

        pldBlockLen
        burstBlockLen
        encInpBlockBytes

        bitMapMask
    end
    
    methods
        function obj = Waveform(varargin)
            setProperties(obj, nargin, varargin{:});
            obj = obj.init();
            if isempty(obj.pldBlockLen)
                obj.pldBlockLen = obj.pldLenEncBits + obj.pldBitPad;
                obj.burstBlockLen = obj.pldLenEncBits + obj.pldBitPad + ...
                    obj.prmbSeqLen + obj.trngSeqLen;
            end
            obj.bitMapMask = obj.buildBitMapMask();
        end
        
        function obj = init(obj)
            switch obj.waveformId
                case 0 % fec rate 1/2
                    obj.prmbSeqLen = 48;
                    obj.trngSeqLen = 32;

                    % fec encoder parameters
                    obj.P  = 17;
                    obj.Q0 = 9;
                    obj.Q1 = 5;
                    obj.Q2 = 14;
                    obj.Q3 = 1;

                    obj.wf_crnc = 0;
                    obj.pldLenInfBytes = 34;
                    obj.pldLenEncBits = 544; % Rate 1/2
                    obj.encInpBlockBytes = 34;
                    obj.codeRate = 0.5;
                    obj.pldBitPad = 0;
                    
                otherwise
                    obj.pldLenInfBytes = 0;
                    obj.pldLenEncBits = 0;
                    obj.pldBitPad = 0;
                    obj.prmbSeqLen = 0;
                    obj.trngSeqLen = 0;
            end
        end
    end

    methods (Access=private)
        function mask = buildBitMapMask(obj)
            mask = zeros(1, obj.burstBlockLen, 'uint8');

            % Ranges - interleaved structure
            i0 = 1;
            i1 = obj.prmbSeqLen;
            j0 = i1 + 1;
            j1 = i1 + obj.pldBlockLen/4;
            k0 = j1 + 1;
            k1 = j1 + obj.trngSeqLen/4;
            j2 = k1 + 1;
            j3 = k1 + obj.pldBlockLen/4;
            k2 = j3 + 1;
            k3 = j3 + obj.trngSeqLen/4;
            j4 = k3 + 1;
            j5 = k3 + obj.pldBlockLen/4;
            k4 = j5 + 1;
            k5 = j5 + obj.trngSeqLen/4;
            j6 = k5 + 1;
            j7 = k5 + obj.pldBlockLen/4;
            k6 = j7 + 1;
            k7 = j7 + obj.trngSeqLen/4;

            % Assign field types (using numeric values)
            if i1 >= i0, mask(i0:i1) = 1; end  % PREAMBLE
            if j1 >= j0, mask(j0:j1) = 2; end  % PAYLOAD
            if k1 >= k0, mask(k0:k1) = 3; end  % TRNGSEQ
            if j3 >= j2, mask(j2:j3) = 2; end  % PAYLOAD
            if k3 >= k2, mask(k2:k3) = 3; end  % TRNGSEQ
            if j5 >= j4, mask(j4:j5) = 2; end  % PAYLOAD
            if k5 >= k4, mask(k4:k5) = 3; end  % TRNGSEQ
            if j7 >= j6, mask(j6:j7) = 2; end  % PAYLOAD
            if k7 >= k6, mask(k6:k7) = 3; end  % TRNGSEQ

            % Generate known sequences
            obj.trngSeq = obj.makeRandomSeq(obj.trngSeqLen);
            obj.prmbSeq = obj.makeRandomSeq(obj.prmbSeqLen);
        end

        function bits = makeRandomSeq(~, N)
            if N <= 0
                bits = uint8([]);
                return;
            end
            % Use fixed seed for reproducibility
            rng(12345);
            bits = uint8(randi([0 1], 1, N));
        end
    end
end
