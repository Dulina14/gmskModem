function symMetrics = demod_aligned_burst(rxBurstAligned, samplesPerSymbol, expectedSymbols)
% DEMOD_ALIGNED_BURST Demap an already aligned burst at symbol rate.
%
% rxBurstAligned is assumed to have already been trimmed to the nominal
% burst duration, so no additional group-delay compensation is applied here.

    arguments
        rxBurstAligned (:,1) {mustBeNumeric}
        samplesPerSymbol (1,1) double {mustBePositive, mustBeInteger}
        expectedSymbols (1,1) double {mustBePositive, mustBeInteger}
    end

    gmskDemapper = GmskDemapper;
    dphi = gmskDemapper(rxBurstAligned);

    sampleIdx = 1:samplesPerSymbol:length(dphi);
    if length(sampleIdx) < expectedSymbols
        error(['demod_aligned_burst: expected at least %d symbols, got %d. ' ...
               'Check burst extraction length and samplesPerSymbol.'], ...
              expectedSymbols, length(sampleIdx));
    end

    symMetrics = dphi(sampleIdx(1:expectedSymbols));
end
