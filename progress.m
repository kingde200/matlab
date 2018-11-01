t = 0:1/10:10-1/10;
lb = -10;
ub = 10;
N = 100;
[psi,xval] = mexihat(lb,ub,N);
figure(1);
plot(xval,psi);
title('Ricker wavelet')
y = fft(psi);
m = abs(y);
p = angle(y);
f = (0:length(y)-1)*50/length(y);
figure(2);
plot(f,m);
title('Magnitude')

figure(3);
plot(f,rad2deg(p));
title('Phase')

y1 = ifft(y);
figure(4);
plot(t,y1);
title('Inverse transform')


x=zeros(100)
for i=1:100
x(i)=1/51.;
if(i>50)
x(i)=1/i;
end
plot(x(i));

lb = -10;
ub = 10;
N = 100;
[psi,xval] = mexihat(lb,ub,N);
y = fft(psi);
m = abs(y);
p = angle(y);
f = (0:length(y)-1)*50/length(y);
wlev=0.5;
y*y1=1;
for y>wlev
y1=1/y;
end
for y<wlev
y1=0;
end
figure(1);
plot(f,m);
figure(2);
plot(f,rad2deg(p));
figure(3);
plot(y1);

