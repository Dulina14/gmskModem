function compare_multipacket_results(txPacketInfo, rxPacketResults, txBytes, rxBytes)
% COMPARE_MULTIPACKET_RESULTS  Visualize multi-packet transmission results
%
% Inputs:
%   txPacketInfo    : struct array from build_multipacket
%   rxPacketResults : struct array from receive_multipacket
%   txBytes         : original transmitted bytes
%   rxBytes         : recovered received bytes
%
% Creates detailed comparison plots and statistics

    numTxPkts = length(txPacketInfo);
    numRxPkts = length(rxPacketResults);
    
    figure('Position', [50 50 1600 900], 'Name', 'Multi-Packet Analysis');
    
    %% Plot 1: Packet Recovery Status
    subplot(3,3,1);
    if ~isempty(rxPacketResults)
        recovered = double([rxPacketResults.recovered]);
        bar(1:length(recovered), recovered, 'FaceColor', [0.2 0.6 0.9]);
        title(sprintf('Packet Recovery (%d/%d successful)', ...
            sum(recovered), numTxPkts));
        xlabel('Packet Number');
        ylabel('Recovered (1=Yes, 0=No)');
        grid on;
        ylim([0 1.2]);
    end
    
    %% Plot 2: Per-Packet Error Rate
    subplot(3,3,2);
    if numRxPkts > 0
        errorRates = zeros(numRxPkts, 1);
        for i = 1:numRxPkts
            if rxPacketResults(i).recovered && i <= numTxPkts
                txPkt = txPacketInfo(i).dataBytes;
                rxPkt = rxPacketResults(i).dataBytes;
                nCompare = min(length(txPkt), length(rxPkt));
                errors = sum(txPkt(1:nCompare) ~= rxPkt(1:nCompare));
                errorRates(i) = errors / nCompare;
            end
        end
        bar(errorRates * 100, 'FaceColor', [0.9 0.3 0.2]);
        title('Per-Packet Byte Error Rate');
        xlabel('Packet Number');
        ylabel('Error Rate (%)');
        grid on;
    end
    
    %% Plot 3: Cumulative Bytes TX vs RX
    subplot(3,3,3);
    if numTxPkts > 0 && numRxPkts > 0
        cumTx = cumsum([txPacketInfo.dataBytes] ~= 0, 2);
        cumTx = cumTx(:, 34:34:end);  % End of each packet
        plot(1:length(cumTx), cumTx, 'b-o', 'LineWidth', 2, 'DisplayName', 'TX');
        hold on;
        if numRxPkts > 0
            rxSizes = arrayfun(@(x) length(x.dataBytes), rxPacketResults);
            cumRx = cumsum(rxSizes);
            plot(1:length(cumRx), cumRx, 'r--x', 'LineWidth', 2, 'DisplayName', 'RX');
        end
        hold off;
        legend('Location', 'northwest');
        title('Cumulative Data Transfer');
        xlabel('Packet Number');
        ylabel('Total Bytes');
        grid on;
    end
    
    %% Plot 4: Byte-by-Byte Comparison (First Packet)
    subplot(3,3,4);
    if numRxPkts >= 1 && rxPacketResults(1).recovered
        txPkt1 = txPacketInfo(1).dataBytes;
        rxPkt1 = rxPacketResults(1).dataBytes;
        nBytes = min(34, min(length(txPkt1), length(rxPkt1)));
        
        x = 1:nBytes;
        plot(x, double(txPkt1(1:nBytes)), 'b-o', 'LineWidth', 1.5, 'DisplayName', 'TX');
        hold on;
        plot(x, double(rxPkt1(1:nBytes)), 'r--x', 'LineWidth', 1.5, 'DisplayName', 'RX');
        
        % Mark errors
        errors = (txPkt1(1:nBytes) ~= rxPkt1(1:nBytes));
        if any(errors)
            errorIdx = find(errors);
            plot(errorIdx, double(rxPkt1(errorIdx)), 'ko', ...
                'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Errors');
        end
        hold off;
        
        legend('Location', 'best');
        title(sprintf('Packet 1 Comparison (%d errors)', sum(errors)));
        xlabel('Byte Index');
        ylabel('Byte Value');
        grid on;
    end
    
    %% Plot 5: Error Distribution Across All Bytes
    subplot(3,3,5);
    nCompare = min(length(txBytes), length(rxBytes));
    if nCompare > 0
        errorMask = (txBytes(1:nCompare) ~= rxBytes(1:nCompare));
        
        % Create histogram of error positions
        if any(errorMask)
            errorPositions = find(errorMask);
            histogram(errorPositions, max(20, ceil(nCompare/50)), ...
                'FaceColor', [0.9 0.2 0.2]);
            title(sprintf('Error Distribution (%d total errors)', sum(errorMask)));
            xlabel('Byte Position');
            ylabel('Number of Errors in Bin');
            grid on;
        else
            text(0.5, 0.5, 'No Errors!', ...
                'HorizontalAlignment', 'center', 'FontSize', 16, ...
                'Color', [0 0.7 0], 'FontWeight', 'bold');
            xlim([0 1]); ylim([0 1]);
            title('Error Distribution');
        end
    end
    
    %% Plot 6: Bit Error Pattern (First 100 bytes)
    subplot(3,3,6);
    nCompare = min(length(txBytes), length(rxBytes));
    nPlot = min(100, nCompare);
    if nPlot > 0
        % Create bit error matrix
        bitErrors = zeros(nPlot, 8);
        for i = 1:nPlot
            if txBytes(i) ~= rxBytes(i)
                txBits = bitget(txBytes(i), 1:8);
                rxBits = bitget(rxBytes(i), 1:8);
                bitErrors(i, :) = (txBits ~= rxBits);
            end
        end
        
        imagesc(bitErrors');
        colormap([1 1 1; 1 0 0]);  % White = no error, Red = error
        title('Bit Error Pattern (first 100 bytes)');
        xlabel('Byte Index');
        ylabel('Bit Position (LSB=1, MSB=8)');
        colorbar('Ticks', [0 1], 'TickLabels', {'OK', 'Error'});
        grid on;
    end
    
    %% Plot 7: Overall Statistics
    subplot(3,3,7);
    axis off;
    
    % Calculate statistics
    totalTxBytes = length(txBytes);
    totalRxBytes = length(rxBytes);
    nCompare = min(totalTxBytes, totalRxBytes);
    
    byteErrors = 0;
    bitErrors = 0;
    if nCompare > 0
        byteErrors = sum(txBytes(1:nCompare) ~= rxBytes(1:nCompare));
        for i = 1:nCompare
            bitErrors = bitErrors + sum(bitget(txBytes(i), 1:8) ~= bitget(rxBytes(i), 1:8));
        end
    end
    
    successfulPkts = sum([rxPacketResults.recovered]);
    
    % Display statistics
    stats = {
        sprintf('\\bfTransmission Statistics\\rm')
        ''
        sprintf('TX Packets: %d', numTxPkts)
        sprintf('RX Packets: %d', numRxPkts)
        sprintf('Successful: %d (%.1f%%)', successfulPkts, 100*successfulPkts/numTxPkts)
        ''
        sprintf('TX Bytes: %d', totalTxBytes)
        sprintf('RX Bytes: %d', totalRxBytes)
        ''
        sprintf('Byte Errors: %d / %d', byteErrors, nCompare)
        sprintf('Byte Error Rate: %.4f%%', 100*byteErrors/nCompare)
        ''
        sprintf('Bit Errors: %d / %d', bitErrors, nCompare*8)
        sprintf('Bit Error Rate: %.4f%%', 100*bitErrors/(nCompare*8))
    };
    
    text(0.1, 0.9, stats, 'VerticalAlignment', 'top', 'FontSize', 10, ...
        'FontName', 'FixedWidth', 'Interpreter', 'tex');
    
    %% Plot 8: Hex Dump Comparison (First Packet)
    subplot(3,3,8);
    axis off;
    if numRxPkts >= 1 && rxPacketResults(1).recovered
        txPkt = txPacketInfo(1).dataBytes;
        rxPkt = rxPacketResults(1).dataBytes;
        nShow = min(16, min(length(txPkt), length(rxPkt)));
        
        hexDump = cell(nShow + 2, 1);
        hexDump{1} = sprintf('\\bfPacket 1 Hex Dump\\rm');
        hexDump{2} = sprintf('  Idx   TX    RX  ');
        
        for i = 1:nShow
            if txPkt(i) == rxPkt(i)
                hexDump{i+2} = sprintf('  %02d:  %02X    %02X', i, txPkt(i), rxPkt(i));
            else
                hexDump{i+2} = sprintf('  %02d:  %02X    \\color{red}%02X\\color{black}  <--', ...
                    i, txPkt(i), rxPkt(i));
            end
        end
        
        text(0.1, 0.95, hexDump, 'VerticalAlignment', 'top', 'FontSize', 9, ...
            'FontName', 'FixedWidth', 'Interpreter', 'tex');
    end
    
    %% Plot 9: Match/Mismatch Summary
    subplot(3,3,9);
    if nCompare > 0
        matches = sum(txBytes(1:nCompare) == rxBytes(1:nCompare));
        mismatches = nCompare - matches;
        
        pie([matches, mismatches], {'Match', 'Mismatch'});
        colormap([0.2 0.8 0.2; 0.9 0.2 0.2]);
        title(sprintf('Overall Byte Match: %.1f%%', 100*matches/nCompare));
    end
    
    sgtitle(sprintf('Multi-Packet Analysis: %d Packets, %d Bytes', ...
        numTxPkts, totalTxBytes), 'FontSize', 14, 'FontWeight', 'bold');
end
