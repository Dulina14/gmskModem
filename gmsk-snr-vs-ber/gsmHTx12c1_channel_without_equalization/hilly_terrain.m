rng('default');

gmskMod = comm.GMSKModulator('BitInput',true, 'SamplesPerSymbol', 8);

x = gmskMod(randi([0 1], 1e4, 1));

v = 120*1e3/3600;
fc = 1.8e9;
fd = v*fc/physconst('lightspeed');

Rsym = 270.833e3;
Rsamp =gmskMod.SamplesPerSymbol * Rsym;
gsmChan =stdchan('gsmHTx12c1', Rsamp, fd);

gsmChan.Visualization = 'Impulse response';
y = gsmChan(x);
