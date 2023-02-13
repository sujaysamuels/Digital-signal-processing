close all;clear;
M=31;
if rem(M,2)~=0
for n=-(M-1)/2:(M-1)/2
h(1+n+(M-1)/2)=-(sin(pi*n*2/3))/((n*pi*2/3))*2/3+(sin(pi*n*1/3))/((n*pi*1/3))*1/3;
end
h((M-1)/2+1)=2/3;
end

ch=input("Enter the option for the window 1.Rectangular 2.Hanning 3.Hamming 4.Nigga filter");

switch(ch)
    case 1
        for n=-((M-1)/2):((M-1)/2)
            w(n+1+(M-1)/2)=1;                                                         %Rectangular
        end
    case 2
        for n=-((M-1)/2):((M-1)/2)
            w(n+1+(M-1)/2)=0.5 + 0.5*cos(2*pi*n/M-1);                                 %Hanning
        end
    case 3
        for n=-((M-1)/2):((M-1)/2)
           w(n+1+(M-1)/2)=0.54+0.46*cos(2*pi*n/M-1);                                 %Hamming
        end
       case 4
        for n=-((M-1)/2):((M-1)/2)                                                    %Nigga filter
           w(n+((M-1)/2)+1)=0.42+0.5*cos(2*pi*n/(M-1))+0.08*cos(4*pi*n/(M-1));
        end

    otherwise
        disp('Enter the correct choice');
end

hd=h.*w;



[H,f]=freqz(hd,1,2048);

an=angle(H);


a=20*log10(abs(H/max(abs(H))));

f1=1000; f2=2000; f3=9000;
Fs2=15000;
t=0:1/Fs2:(6/min([f1 f2 f3 ]));
x=sin(2*pi*f1*t) + sin(2*pi*f2*t)+sin(2*pi*f3*t);
X=abs(fft(x,length(x)));
k=length(x);
fas=Fs2*(0:k-1)/k;

y=filter(hd,1,x);
Y=abs(fft(y,length(y)));

subplot(4,1,1);
plot(fas,X/max(X),'r');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Input Signal');
subplot(4,1,2);
plot(f,a,'b')
xlabel('frequency');
ylabel('Magnitude');
title('Magnitude Response of Filter');
subplot(4,1,3);
Ny=length(y);
plot(f,an,'g');
xlabel('frequency');

ylabel('Phase');
title('Phase Response of Filter ');
subplot(4,1,4);
Y=abs(fft(y,Ny));
plot(fas,Y/max(Y),'m');
set(gca,'xlim',[0 Fs2/2],'ylim',[0 2]);
xlabel('frequency');
ylabel('Magnitude');
title('Spectrum of Output Signal');




