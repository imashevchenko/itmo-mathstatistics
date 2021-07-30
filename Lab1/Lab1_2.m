clc;
clear;


left=-inf;
right=inf;
n = 10^6;
a = -1;
b = 1;
gam = 0.95;
T = norminv((gam + 1)/2);
X = normrnd(a, b, 1, n);
z = sqrt(abs(X))*sqrt(2*pi);
I = mean(z);
d = (std(z)*T/sqrt(n));
In = [I - d, I + d];
IReal = integral(@myfunc,-inf,inf);

function y = myfunc(x)
y=sqrt(abs(x)).*exp((-(x+1).^2)/2);
end
