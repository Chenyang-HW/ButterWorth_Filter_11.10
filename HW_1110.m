clc;
clear;

AudioSignal='1.wav';

[s, Fs]=audioread(AudioSignal);
AudioThroughButterPass=ButterPassFilter(AudioSignal);
time=(1:length(s))/Fs;

subplot(6,1,1);plot(time, s);
subplot(6,1,2);plot(time, AudioThroughButterPass);
%sound(AudioThroughButterPass,Fs);
SF=fft(AudioThroughButterPass);
subplot(6,1,3);plot((1:length(SF)/2)*Fs/length(SF),2*abs(SF(1:length(SF)/2))/length(SF));

audiowrite('2.wav',AudioThroughButterPass,Fs)
AudioSignalPass='2.wav';

AudioThroughButterLow=ButterLowFilter(AudioSignalPass);
subplot(6,1,4);plot(time, AudioThroughButterLow);
sound(AudioThroughButterLow,Fs);
SFF=fft(AudioThroughButterLow);
subplot(6,1,5);plot((1:length(SFF)/2)*Fs/length(SFF),2*abs(SFF(1:length(SFF)/2))/length(SFF));

AudioThroughButterLowOriginal=abs(AudioThroughButterLow);
subplot(6,1,6);plot(time, AudioThroughButterLowOriginal);
