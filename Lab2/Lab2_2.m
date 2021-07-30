clc
clear
pkg load statistics

m=10^2;
n=10^4;
a=1;
b=11
t=3;
mean_delta=0;
k=10;
ft0=unifcdf(t,a,b);
for (j=1:k)
gam=0.89+j*0.01
T=norminv((1+gam)/2);
x=unifrnd(a,b,n,m);
y=mean(x<t);
d=T*sqrt(y.*(1-y)/n);
up=y+d;
down=y-d;
count=0;
for (i=1:m)
  if (up(i)<ft0)
    count=count+1;
  endif
  if (down(i)>ft0)
    count=count+1;
  endif
endfor
delta=count/m
mean_delta=mean_delta+delta;
endfor
mean_delta=mean_delta/10
