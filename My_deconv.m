%
% This generated a synthetic trace and noise, filters it and computes an STA/LTA trace 
%
%
function My_deconv(NN,Fs,nlev,Fu,Fl,t1,t2) 
x=zeros(1,NN);
t = zeros(1,NN);

for i=1:NN
t(i) = (i-1)/Fs;
end
%for i=10000:24000
%x(i) = x(i)+(sin(2.*pi*i/230.)+sin(2.*pi*i/270.))*(1.-cos((i-20000.)*2.*pi/4000.));
%end
%Fl = 0.5.;
%Fu = 20.;
%[b,a] = butter(5,[Fl Fu]./(Fs/2));
%x=filter(b,a,x);
figure(1);
plot(t,x);
lb = -10;
ub = 10;
N = 100;
[psi,xval] = mexihat(lb,ub,N);
N1 = int32(t1*Fs);
N2 = int32(t2*Fs);
x(N1) = x(N1) + 1.  ;
x(N2) = x(N2) + 1.  ;
figure(2);
for i=1:NN
x(i) = x(i)+nlev*erfinv(2.*(rand-0.5));
end
c=conv(x,psi);
plot(t,c(1:NN));

[q,r]=deconv(c,psi);
lenq = length(q);
display(lenq);
figure(3);
plot(t,q);
[cros, lags]=xcorr(q,40000,'coef');
figure(4);
plot(lags,cros);










                                                                                                                                                         





