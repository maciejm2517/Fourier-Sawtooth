clc; close all; clear;
x=load('sawtooth.dat');
n=length(x);
ts=0.01;
t=ts*[0:n-1];
figure(1);
plot(t,x)
f0=2;
ks_max=5;
X=fft(x);
a0s=mean(x);
xr=0;
for ks=1:ks_max
  f=f0*ks;
  k=f*n*ts;
  cks=X(k+1)/n;
  aks=real(cks)*2;
  bks=-imag(cks)*2;
  xr=xr+aks*cos(2*pi*f*t)+bks*sin(2*pi*f*t);
end
plot(t,xr+a0s)

cks=0;
x_n=0;
for ks=1:ks_max
  for s=0:n-1
    cks=cks+x(s+1)*e^(-j*2*pi*ks*f0*s*ts);
  end
  cks=cks/n;
  aks=real(cks)*2;
  bks=-imag(cks)*2;
  x_n=x_n+aks*cos(2*pi*ks*f0*t)+bks*sin(2*pi*ks*f0*t); 
end  
figure
plot(t,x_n+a0s);
