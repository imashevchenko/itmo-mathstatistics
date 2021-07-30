clc;
clear;

pkg load statistics;

a=0;
b=8;
n=100;
X=0:0.1:8;
Y=unifcdf(X,a,b);
#plot(X,Y);

x=unifrnd(a,b,n,1);
Fn_t= @(t) sum(x<t)/n;
[x_st, y_st]=stairs(X, Fn_t(X));
#plot(X,Y,x_st, y_st); 

u=1.36;
left=max(0,y_st-u/sqrt(n));
right=min(1,y_st+u/sqrt(n));
plot(X,Y,x_st, y_st,x_st,left,x_st,right); 


N=10^4;
printf('Критерий Колмогорова для N=10^4 \n');
i=1:N;
u=1.36
Fx=unifcdf(sort(unifrnd(a,b,N,1)),a,b);
d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
printf('d = %d \n', d);
if (d>=u)
  printf('Основная гипотеза отвергается \n')  
else 
  printf('Основная гипотеза принимается \n')
endif

printf('Критерий Смирнова для N=10^4 \n');
c=0.46
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
printf('w = %d \n', w)
if w>c
  printf('Основная гипотеза отвергается. Принимается альтернатива\n')
else
  printf('Основная гипотеза принимается. \n')
endif

N=10^6;
i=1:N;
printf('Критерий Колмогорова для N=10^6 \n');
u=1.36
Fx=unifcdf(sort(unifrnd(a,b,N,1)),a,b);
d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
printf('d = %d \n', d);
if (d>=u)
  printf('Основная гипотеза отвергается \n')  
else 
  printf('Основная гипотеза принимается \n')
endif

printf('Критерий Смирнова для N=10^6 \n');
c=0.46
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
printf('w = %d \n', w)
if w>c
  printf('Основная гипотеза отвергается. Принимается альтернатива\n')
else
  printf('Основная гипотеза принимается. \n')
endif