function rxEqualized = equalize_signal(rxSignal, hEst)
%EQUALIZE_SIGNAL Apply a 1-tap complex equalizer to the received signal.
%
% Inputs:
%   rxSignal : received complex sample stream
%   hEst     : estimated flat channel coefficient
%
% Output:
%   rxEqualized : equalized complex sample stream

    arguments
        rxSignal (:,1) {mustBeNumeric}
        hEst (1,1) {mustBeNumeric}
    end

    denom = hEst;
    if abs(denom) < 1e-12
        if denom == 0
            denom = 1e-12;
        else
            denom = denom + 1e-12 * exp(1j * angle(denom));
        end
    end

    rxEqualized = rxSignal ./ denom;
end
