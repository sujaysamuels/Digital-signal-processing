clear ;close all
M=31;
fp1=1000;fp2=6000;fs1=2000;fs2=4000;
Fs=15000;
ws=[2*fs1/Fs 2*fs2/Fs];
wp=[2*fp1/Fs 2*fp2/Fs];
As=60; Ap=2;
[n,wn]=buttord(wp,ws,Ap,As);
[b,a]=butter(n,wn,'stop');
[H,f]=freqz(b,a,2048,Fs);

f1=500;f2=3000; f3=6500;
Fs2=15000;
t=0:(1/Fs2):(6/min([f1 f2 f3]));
x=sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);
N=length(x);
X=abs(fft(x,N));

y=filter(b,a,x);
Ny=length(y);
Y=abs(fft(y,Ny));
fas=Fs2*(0:N-1)/N;
ab=20*log10(abs(H/max(abs(H))));
an=angle(H);
subplot(411);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 1 ]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Input Signal');
subplot(412);
plot(f,ab,'b');
xlabel('frequency');
ylabel('Magnitude');
title('Magnitude Response of HPF (Butterworth)');

subplot(413);
plot(f,an,'g');
xlabel('frequency');
ylabel('Phase');
title('Phase Response of HPF (Butterworth)');
subplot(414);
plot(fas,Y/max(Y),'m');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 1]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Output Signal');

