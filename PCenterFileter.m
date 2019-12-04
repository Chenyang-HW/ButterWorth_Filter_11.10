clc;
clear;

AudioSignal='1.wav';

[s, Fs]=audioread(AudioSignal);
time=(1:length(s))/Fs;
plot(time, s);

AudioThroughButterPass=ButterPassFilter(AudioSignal);
plot(time, AudioThroughButterPass);

AbsPassOut=abs(AudioThroughButterPass);

audiowrite('2.wav',AbsPassOut,2*Fs);
AudioThroughButterLow=ButterLowFilter('2.wav');
plot(time, AudioThroughButterLow);
