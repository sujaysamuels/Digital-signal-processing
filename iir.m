clear ; close all;
M=31;
fs1=1000;fs2=6000;fp1=2000;fp2=4000;Fs=15000;
As=60;Ap=2;
ws=[2*fs1/Fs 2*fs2/Fs];
wp=[2*fp1/Fs 2*fp2/Fs];
[n,wn]=buttord(wp,ws,Ap,As);
[b,a]=butter(n,wn,"stop");
[H,f]=freqz(b,a,2048,Fs);
f1=500;f2=2000;f3=6500;Fs2=15000;
t=0:(1/Fs2):(6/min([f1 f2 f3 ]));
x=sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);
N=length(x);
X=abs(fft(x,N));
y=filter(b,a,x);
Ny=length(y);
Y=abs(fft(y,Ny));
fas=Fs2*(0:N-1)/N;
an=angle(H);
a=20*log10(abs(H/max(abs(H))));

subplot(411);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('input spectrum');

subplot(414);
plot(fas,Y/max(Y),'g');
set(gca,'xlim',[0 Fs/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('output spectrum');

subplot(412);
plot(f,an,'b');
xlabel('frequency');
ylabel('phase');

subplot(413);
plot(f,a,'m');
xlabel('frequency');
ylabel('magnitude');

