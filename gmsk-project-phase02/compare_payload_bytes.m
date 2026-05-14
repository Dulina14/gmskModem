function [byteErrors, txBytes, rxBytes] = compare_payload_bytes(txCsvFile, rxCsvFile, expectedPayloadBytes)
% COMPARE_PAYLOAD_BYTES Compare transmitted and received payload bytes.

    txData = read_axi_stream_csv(txCsvFile);
    rxData = read_axi_stream_csv(rxCsvFile);

    txBytes = uint8(txData.bytes(:));
    rxBytes = uint8(rxData.bytes(:));

    if length(txBytes) < expectedPayloadBytes
        txBytes = [txBytes; zeros(expectedPayloadBytes - length(txBytes), 1, 'uint8')];
    else
        txBytes = txBytes(1:expectedPayloadBytes);
    end

    if length(rxBytes) < expectedPayloadBytes
        rxBytes = [rxBytes; zeros(expectedPayloadBytes - length(rxBytes), 1, 'uint8')];
    else
        rxBytes = rxBytes(1:expectedPayloadBytes);
    end

    mismatchIdx = find(txBytes ~= rxBytes);
    byteErrors = length(mismatchIdx);

    fprintf('[COMPARE] Payload bytes compared: %d | byte errors: %d\n', ...
        expectedPayloadBytes, byteErrors);

    if ~isempty(mismatchIdx)
        fprintf('[COMPARE] First mismatches:\n');
        showCount = min(8, byteErrors);
        for k = 1:showCount
            idx = mismatchIdx(k);
            fprintf('  Byte %2d: tx=%02X rx=%02X\n', idx, txBytes(idx), rxBytes(idx));
        end
    end

    fprintf('\n');
end
