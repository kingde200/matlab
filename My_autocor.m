%
% This generated a synthetic trace and noise, filters it and computes an STA/LTA trace 
%
%
function My_autocor(NN,Fl,Fu,Fs,nlev,t1,t2) 
x=zeros(1,NN);
t = zeros(1,NN);
%Fs= 250;
%nlev = 0.2;
for i=1:NN
x(i) = nlev*(rand-0.5);
t(i) = (i-1)/Fs;
end
%for i=10000:24000
%x(i) = x(i)+(sin(2.*pi*i/230.)+sin(2.*pi*i/270.))*(1.-cos((i-20000.)*2.*pi/4000.));
%end
%Fl = 0.5.;
%Fu = 20.;
[b,a] = butter(5,[Fl Fu]./(Fs/2));
x=filter(b,a,x);
figure(1);
plot(t,x);
lb = -10;
ub = 10;
N = 100;
[psi,xval] = mexihat(lb,ub,N);
figure(2);
plot(xval,psi);
N1 = int32(t1*Fs-N/2);
N2 = int32(t2*Fs-N/2);
for i=1:100
    x(i+N1) = x(i+N1)+psi(i);
    x(i+N2) = x(i+N2)+psi(i);
end
figure(3);
plot(t,x);
[cros, lags]=xcorr(x,40000,'coef');
figure(4);
plot(lags,cros);








                                                                                                                                                         





