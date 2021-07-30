clc;
clear;

pkg load statistics;

a=4;
sigma=sqrt(2);
n=100;
X=0:0.1:8;
Y=normcdf(X,a,sigma);
#plot(X,Y);

x=normrnd(a,sigma,n,1);
Fn_t= @(t) sum(x<t)/n;
[x_st, y_st]=stairs(X, Fn_t(X));
#plot(X,Y,x_st, y_st); 

u=1.36;
left=max(0,y_st-u/sqrt(n));
right=min(1,y_st+u/sqrt(n));
plot(X,Y,x_st, y_st,x_st,left,x_st,right); 


N=10^4;
printf('�������� ����������� ��� N=10^4 \n');
i=1:N;
u=1.36
Fx=normcdf(sort(normrnd(a,sigma,N,1)),a,sigma);
d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
printf('d = %d \n', d);
if (d>=u)
  printf('�������� �������� ����������� \n')  
else 
  printf('�������� �������� ����������� \n')
endif

printf('�������� �������� ��� N=10^4 \n');
c=0.46
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
printf('w = %d \n', w)
if w>c
  printf('�������� �������� �����������. ����������� ������������\n')
else
  printf('�������� �������� �����������. \n')
endif

N=10^6;
i=1:N;
printf('�������� ����������� ��� N=10^6 \n');
u=1.36
Fx=normcdf(sort(normrnd(a,sigma,N,1)),a,sigma);
d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
printf('d = %d \n', d);
if (d>=u)
  printf('�������� �������� ����������� \n')  
else 
  printf('�������� �������� ����������� \n')
endif

printf('�������� �������� ��� N=10^6 \n');
c=0.46
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
printf('w = %d \n', w)
if w>c
  printf('�������� �������� �����������. ����������� ������������\n')
else
  printf('�������� �������� �����������. \n')
endif