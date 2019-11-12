function AudioThroughButterPass=ButterPassFilter(AudioSignal)

[s, Fs]=audioread(AudioSignal);

Fc=1000;    %center frequency
Fbw=600;    %pass band
order=1;

Wn=[(Fc-Fbw)/(Fs/2) (Fc+Fbw)/(Fs/2)];

%Design Butterworth band pass filter
[a,b]=butter(order,Wn);
AudioThroughButterPass=filtfilt(a,b,s);    

end