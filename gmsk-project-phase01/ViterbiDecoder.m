classdef ViterbiDecoder < matlab.System
% ViterbiDecoder — soft-input Viterbi decoder for convolutional codes
%
% Usage in pipeline (after payload extraction):
%   vit = ViterbiDecoder('constraintLength', 7, 'generatorOctal', [171 133], ...
%                        'tracebackLen', 35, 'softBitWidth', 3, ...
%                        'inputType', "soft_llr");
%   decodedBits = vit(receivedLLRs);
%
% Input types supported via inputType:
%   "soft_llr" : input contains signed LLR-like values
%                (negative => likely 0, positive => likely 1)
%   "hard"     : input contains 0/1 bits

    properties

        nVar = 1;            % Noise variance used for LLR scaling (if inputType="soft_llr")

        
        % Soft-output scaling & format
        llrGain = 1;            % extra gain to absorb unknown amplitude A
        llrClip (1,1) double {mustBePositive} = 127;          % clip magnitude (use 127 for int8, 32767 for int16)
        

        % Convolutional code definition
        constraintLength (1,1) double {mustBeInteger, mustBePositive} = 7
        generatorOctal (1,:) double {mustBeInteger, mustBePositive} = [171 133]  % rate 1/2 default

        slicerThreshold = 0;

        % Viterbi settings
        tracebackLen (1,1) double {mustBeInteger, mustBePositive} = 35
        mode (1,1) string {mustBeMember(mode, ["trunc","term","cont"])} = "trunc"

        % Input interpretation
        inputType (1,1) string {mustBeMember(inputType, ["soft_llr","hard"])} = "soft_llr"

        % Soft quantization bits for vitdec(...,'soft',softBitWidth)
        softBitWidth (1,1) double {mustBeInteger, mustBePositive} = 3

        
        
        % If true, also store the soft metrics used for vitdec
        saveSoftMetrics (1,1) logical = false
    end

    properties(Access=private)
        trellis
        debugSoftMetrics  % Optional debug output
    end

    methods
        function obj = ViterbiDecoder(varargin)
            setProperties(obj, nargin, varargin{:});
        end
    end

    methods(Access=protected)
        function setupImpl(obj)
            obj.trellis = poly2trellis(obj.constraintLength, obj.generatorOctal);
        end

        function decodedBits = stepImpl(obj, receivedBits)
            
            in = receivedBits(:);

            if obj.inputType == "hard"
                % Hard bits 0/1 -> Viterbi hard-decision
                hardBits = in > obj.slicerThreshold; 
                decoded = vitdec(hardBits, obj.trellis, obj.tracebackLen, char(obj.mode), 'hard');

            else
                llr = (2/obj.nVar) * obj.llrGain * double(in);  % Scale LLRs by noise variance and gain
                llr = max(min(llr, obj.llrClip), -obj.llrClip);  % Clip LLRs to prevent extreme values

                % Soft LLR-like input -> quantize to vitdec soft metric integers
                softMetrics = obj.llrToSoftMetric(llr, obj.softBitWidth, obj.llrClip);

                if obj.saveSoftMetrics
                    obj.debugSoftMetrics = softMetrics;
                end

                decoded = vitdec(softMetrics, obj.trellis, obj.tracebackLen, char(obj.mode), 'soft', obj.softBitWidth);
            end

            decodedBits = uint8(decoded(:));
        end
    end

    methods(Static, Access=private)
        function m = llrToSoftMetric(llr, softBits, clipVal)
            % CORRECTED: Map signed LLR -> quantized metric for vitdec soft input.
            % 
            % vitdec soft-decision convention:
            %   metric = 0           means "strongly bit 0"
            %   metric = 2^N - 1     means "strongly bit 1"
            %
            % Input LLR convention (standard):
            %   llr < 0  means "likely bit 0"
            %   llr > 0  means "likely bit 1"
            %
            % Mapping:
            %   llr = -clipVal  -> metric = 0
            %   llr = 0         -> metric = (2^softBits - 1)/2  (neutral)
            %   llr = +clipVal  -> metric = 2^softBits - 1

            llr = double(llr(:));
            llr = max(min(llr, clipVal), -clipVal);

            maxVal = 2^softBits - 1;
            
            % Linear mapping: [-clipVal, +clipVal] -> [0, maxVal]
            m = round( (llr + clipVal) * (maxVal / (2*clipVal)) );

            m = uint8(max(min(m, maxVal), 0));
        end
    end
    
    methods
        function metrics = getDebugMetrics(obj)
            metrics = obj.debugSoftMetrics;
        end
    end
end
