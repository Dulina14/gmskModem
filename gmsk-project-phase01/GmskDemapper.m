classdef GmskDemapper < matlab.System
    % GMSK demapper:
    % 1) phase estimation (CORDIC or atan2)
    % 2) unwrap
    % 3) differentiate => dphi (radians/sample)

    methods
        function obj = GmskDemapper(varargin)
            setProperties(obj, nargin, varargin{:});
        end
    end

    methods(Access=protected)
        function burst = stepImpl(~, burst)
            validateattributes(burst, {'numeric'}, {'vector','nonempty'});

            rx = burst(:); % column
            cartin_q14 = double(rx) / 2;  % Q15 -> Q14 scaling

            % Use MATLAB's atan2 (or CORDIC if available)
            if exist('cordic_atan_mex', 'file') == 3
                phase18 = cordic_atan_mex(cartin_q14);
                phaseRad = double(phase18) ./ 2^15;
            else
                phaseRad = atan2(imag(cartin_q14), real(cartin_q14));
            end

            % Unwrap phase to avoid discontinuities
            phaseUnwrapped = unwrap(phaseRad);
            
            % Differentiate to get instantaneous frequency (phase change)
            dphi = [phaseUnwrapped(1); diff(phaseUnwrapped)];

            burst = dphi;
        end
    end
end
