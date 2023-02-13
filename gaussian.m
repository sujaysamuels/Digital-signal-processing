x1=(-5:1:0);
y1=2.^(x1);
figure
subplot(3,1,1)
plot(x1,y1)
xlabel('n');
ylabel('y(n)');
title("exponential 1");
axis tight;
x2=(0:1:5);
y2=2.^(x1);
y22=fliplr(y2);
subplot(3,1,2)
plot(x2,y22);
xlabel('n');
ylabel('y(n)');
title("exponential 2");
axis tight;
y=[y1 y22];
x=[x1 x2];
subplot(3,1,3)
stem(x,y);
xlabel('n');
ylabel('y(n)');
title("Gaussian Distribution");