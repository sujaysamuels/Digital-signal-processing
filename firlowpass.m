clear;close all;
M=31;


if rem(M,2)~=0
for n=-(M-1)/2:(M-1)/2
h(1+n+(M-1)/2)=0.25*(sin(pi*n/4))/((n*pi/4));
end
h((M-1)/2+1)=0.25;
end

stem(0:length(h)-1,h,'b');

xlabel('n');
ylabel('h(n)');
title('Impulse Response');
figure;

hn=h.*rectwin(length(h))';
hn1=h.*hamming(length(h))';
hn2=h.*hann(length(h))';
hn3=h.*blackman(length(h))';
[H,frect]=freqz(hn,1,2048);
[H1,fham]=freqz(hn1,2048);
[H2,fhan]=freqz(hn2,1,2048);

[H3,fblack]=freqz(hn3,1,2048);
a=20*log10(abs(H/max(abs(H))));
a1=20*log10(abs(H1/max(abs(H1))));
a2=20*log10(abs(H2/max(abs(H2))));
a3=20*log10(abs(H3/max(abs(H3))));
an=angle(H);
an1=angle(H1);
an2=angle(H2);
an3=angle(H3);

f1=500;f2=2000;
Fs2=8000;
t=0:(1/Fs2):(6/min([f1 f2 ]));
x=sin(2*pi*f1*t)+sin(2*pi*f2*t);
N=length(x);
X=abs(fft(x,N));
fas=Fs2*(0:N-1)/N;

y=filter(hn,1,x);
y1=filter(hn1,1,x);
y2=filter(hn2,1,x);
y3=filter(hn3,1,x);
%Rectwin
subplot(4,1,1);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Input Signal');
subplot(4,1,2);
plot(frect,a,'b')
xlabel('frequency');
ylabel('Magnitude');
title('Magnitude Response of Filter (Rect-window)');
subplot(4,1,3);
Ny=length(y);
plot(frect,an,'g');
xlabel('frequency');

ylabel('Phase');
title('Phase Response of Filter (Rect-window)');
subplot(4,1,4);
Y=abs(fft(y,Ny));
plot(fas,Y/max(Y),'m');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Output Signal');
%Hamm
figure;
subplot(4,1,1);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Input Signal');
subplot(4,1,2);
plot(fham,a1,'b');
xlabel('frequency');
ylabel('Magnitude');
title('Magnitude Response of Filter (Hamming-window)');
subplot(4,1,3);

plot(fham,an1,'g');
xlabel('frequency');
ylabel('Phase');
title('Phase Response of Filter (Hamming-window)');
subplot(4,1,4);
Ny=length(y1);
Y=abs(fft(y1,Ny));
plot(fas,Y/max(Y),'m');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Output Signal');
%Hanning
figure;
subplot(4,1,1);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Input Signal');
subplot(4,1,2);
plot(fhan,a2,'b');
xlabel('frequency');

ylabel('Magnitude');
title('Magnitude Response of Filter (Hanning-window)');
subplot(4,1,3);
plot(fhan,an2,'g');
xlabel('frequency');
ylabel('Phase');
title('Phase Response of Filter (Hanning-window)');
subplot(4,1,4);
Ny=length(y2);
Y=abs(fft(y2,Ny));
plot(fas,Y/max(Y),'m');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Output Signal');
%Blackman
figure;
subplot(4,1,1);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Input Signal');

subplot(4,1,2);
plot(fblack,a3,'b');
xlabel('frequency');
ylabel('Magnitude');
title('Magnitude Response of Filter (Blackman-window)');
subplot(4,1,3);
plot(fblack,an3,'g');
xlabel('frequency');
ylabel('Phase');
title('Phase Response of Filter (Blackman-window)');
subplot(4,1,4);
Ny=length(y3);
Y=abs(fft(y3,Ny));
plot(fas,Y/max(Y),'m');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Output Signal');