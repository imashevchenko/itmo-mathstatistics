clc
clear
pkg load statistics

up=[];
down=[];
m=10^2;
n=10^4;
a=2;
sigma=sqrt(2);
t=1.5;
mean_delta=0;
k=10;
ft0=normcdf(t,a,sigma);
for (j=1:k)
gam=0.89+j*0.01
T=norminv((1+gam)/2);
x=normrnd(a,sigma,n,m);
y=mean(x<t);
x=1:100;
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



  
 
