function AudioThroughButterLow=ButterLowFilter(AudioSignal)

[s, Fs]=audioread(AudioSignal);

Wc=10;  %cutoff frequency
order=1;
[b, a]=butter(order, Wc/(Fs/2), 'low');
AudioThroughButterLow=filter(b, a, s);

end
