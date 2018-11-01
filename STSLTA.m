%
% This generated a synthetic trace and noise, filters it and computes an STA/LTA trace 
%
%
x=zeros(1,100000);
t = zeros(1,100000);
for i=1:100000
x(i) = 0.5*rand();
t(i) = 0.004*i;
end
for i=20000:24000
x(i) = x(i)+(sin(2.*pi*i/230.)+sin(2.*pi*i/270.))*(1.-cos((i-20000.)*2.*pi/4000.));
end
Fl = .5;
Fu = 20.;
Fs = 250.;
[b,a] = butter(5,[Fl Fu]./(Fs/2));
x=filter(b,a,x);
lta = zeros(1,100000);
sta = zeros(1,100000);
slta = zeros(1,100000);
for i=15000:100000
  for j = 1:15000
      lta(i) = lta(i)+x(i-j+1)*x(i-j+1)/15000.;
  end 
end
for i=250:100000
  for j = 1:250
      sta(i) = sta(i)+x(i-j+1)*x(i-j+1)/250.;
  end 
end
for i=15000:100000
      slta(i) = sta(i)/lta(i);
end
plot(t,x,t,slta);


x=zeros(1,100000);
t = zeros(1,100000);
for i=1:100000
x(i) = 0.5*rand();
t(i) = 0.004*i;
end
for i=20000:24000
x(i) = x(i)+(sin(2.*pi*i/230.)+sin(2.*pi*i/270.))*(1.-cos((i-20000.)*2.*pi/4000.));
figure(1);
plot(t,x);
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





 
