clc;
clear;


n=10^6;
a=1;
b=3;
gam=0.95;

x=unifrnd(a,b,1,n);
z=log(4-x)./(x+2).*(b-a);
I=mean(z);
I1=mean(I);
d=std(z).*norminv((1+gam)./2)./sqrt(n);
d1=mean(d);
In=[I1-d1,I1+d1];
IReal=quad('log(4-x)./(x+2)',a,b);