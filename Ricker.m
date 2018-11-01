t = 0:1/50:10-1/50;
lb = -10;
ub = 10;
N = 100;
[psi,xval] = mexihat(lb,ub,N);
figure(1);
plot(xval,psi);
title('Ricker wavelet')
x = sin(2*pi*15*t) + sin(2*pi*20*t);
y = fft(x);
m = abs(y);
p = angle(y);
f = (0:length(y)-1)*50/length(y);
figure(2);
plot(f,m);
title('Magnitude')

figure(3);
plot(f,rad2deg(p));
title('Phase')
