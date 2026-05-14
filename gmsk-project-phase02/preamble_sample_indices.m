function sampleIdx = preamble_sample_indices(bitMapMask, samplesPerSymbol)
% PREAMBLE_SAMPLE_INDICES Return aligned sample indices for preamble bits.

    preambleBits = find(bitMapMask(:) == 1);
    sampleIdx = zeros(length(preambleBits) * samplesPerSymbol, 1);

    for k = 1:length(preambleBits)
        s0 = (preambleBits(k) - 1) * samplesPerSymbol + 1;
        sampleIdx((k - 1) * samplesPerSymbol + (1:samplesPerSymbol)) = s0 : s0 + samplesPerSymbol - 1;
    end
end
