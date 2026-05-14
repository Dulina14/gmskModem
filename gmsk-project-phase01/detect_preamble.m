function [detections, corrSignal] = detect_preamble(llrs, preambleSeq, threshold, minSpacing)
% DETECT_PREAMBLE  Detect preamble in received bit stream using correlation
%
% Inputs:
%   rxBits       : uint8 or logical vector of received bits
%   preambleSeq  : uint8 or logical vector of known preamble sequence
%   threshold    : correlation threshold (0 to 1), default 0.7
%
% Outputs:
%   detectedIdx  : index where preamble starts (0 if not detected)
%   corrPeak     : peak correlation value
%   corrSignal   : full correlation signal
%
% The function uses bipolar correlation: 0 -> -1, 1 -> +1


    if nargin < 3
        threshold = 0.7;
    end
    if nargin < 4
        minSpacing = 500;  % Minimum bits between packet starts
    end

    % Convert to bipolar: 0 -> -1, 1 -> +1
    preambleBipolar = double(preambleSeq(:)) * 2 - 1;
    

    % Compute correlation
    corrRaw = conv(llrs, flipud(preambleBipolar), 'valid');
    corrSignal = corrRaw / length(preambleSeq);

    % Find all peaks above threshold
    detections = struct('index', {}, 'correlation', {}, 'packetNum', {});

    % Non-maximum suppression
    corrLen = length(corrSignal);
    usedIndices = false(corrLen, 1);
    
    packetNum = 0;
    
    while true
        % Find maximum in remaining signal
        corrTemp = corrSignal;
        corrTemp(usedIndices) = -inf;
        [maxCorr, maxIdx] = max(corrTemp);
        
        % Check if above threshold
        if maxCorr < threshold
            break;
        end
        
        % Add detection
        packetNum = packetNum + 1;
        detections(packetNum).index = maxIdx;
        detections(packetNum).correlation = maxCorr;
        detections(packetNum).packetNum = packetNum;
        
        % Mark nearby indices as used (non-maximum suppression)
        suppressStart = max(1, maxIdx - minSpacing);
        suppressEnd = min(corrLen, maxIdx + minSpacing);
        usedIndices(suppressStart:suppressEnd) = true;
    end
    
    % Sort by index (chronological order)
    if ~isempty(detections)
        [~, sortIdx] = sort([detections.index]);
        detections = detections(sortIdx);
        
        % Renumber packets
        for i = 1:length(detections)
            detections(i).packetNum = i;
        end
    end
    
    fprintf('=== Preamble Detection Results ===\n');
    fprintf('Detected %d packets:\n', length(detections));
    for i = 1:length(detections)
        fprintf('  Packet %d: index %6d, correlation %.3f\n', ...
            i, detections(i).index, detections(i).correlation);
    end
    fprintf('===================================\n\n');
    
end
