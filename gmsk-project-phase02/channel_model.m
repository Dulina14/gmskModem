function rxSignal = channel_model(txSignal, signalPower, SNR_dB)

%% Parameters (Channel only)
SPS  = 4;
Rsym = 270.833e3;
Rsamp = SPS * Rsym;

v  = 0;                 % velocity (m/s)
fc = 1.8e9;
fd = v*fc/physconst('lightspeed');

%% GSM channel
gsmChan = stdchan('gsmHTx12c1', Rsamp, fd);
reset(gsmChan);

%% Fading
fadedSignal = gsmChan(txSignal);

% Normalize
fadedSignal = fadedSignal / rms(fadedSignal) * sqrt(signalPower);

%% AWGN
SNR_linear = 10^(SNR_dB/10);
noisePower = signalPower / SNR_linear;

noise = sqrt(noisePower/2) * ...
    (randn(size(fadedSignal)) + 1j*randn(size(fadedSignal)));

rxSignal = fadedSignal + noise;

fprintf('[CHANNEL] Applied fading + AWGN (SNR = %.1f dB)\n', SNR_dB);

end