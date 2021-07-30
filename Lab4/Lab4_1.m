pkg load statistics

a=5;
sigma=sqrt(2);

x=0:0.1:10;
y=normpdf(x,a,sigma);
#plot(x,y);

N=10^4;
X=sort(normrnd(a,sigma,N,1));
m=100;
h=(X(N)-X(1))/m;
fn_t= @ (x) (sum(X<x)-sum(X<x-h))/(h*N);
r=X(1):h:X(N);
[x_st,y_st]=stairs(r,fn_t(r+h));
plot(x_st,y_st, x,y);


chi2=0;
vector_normcdf=[];
for (i=1:m)
  vector_normcdf(i)=normcdf(X(1)+h*i,a,sigma);
endfor
for (i=2:m)
chi2=chi2+N*(fn_t(X(1)+h*i)*h-(vector_normcdf(i)-vector_normcdf(i-1))).^2/(vector_normcdf(i)-vector_normcdf(i-1));
endfor
if (chi2 < chi2inv(0.95,m-1))
  printf('Основная гипотеза принимается, chi2=%d, quantile=%d \n', chi2, chi2inv(0.95,m-1));
else 
  printf('Основная гипотеза отвергается \n');
endif 


error_count=0;
for (j=1:1000)
chi2=0;
X=sort(normrnd(a,sigma,N,1));
m=100;
h=(X(N)-X(1))/m;
fn_t= @ (x) (sum(X<x)-sum(X<x-h))/(h*N);
for (i=1:m)
  vector_normcdf(i)=normcdf(X(1)+h*i,a,sigma);
endfor
for (i=2:m)
chi2=chi2+N*(fn_t(X(1)+h*i)*h-(vector_normcdf(i)-vector_normcdf(i-1))).^2/(vector_normcdf(i)-vector_normcdf(i-1));
endfor
if (chi2>=chi2inv(0.95,100))
  error_count=error_count+1;
endif
endfor
printf('Propability=%d', error_count/1000)

error_count2=0;
delta=0.03;

for (j=1:1000)
chi2=0;
X=sort(normrnd(a-delta,sigma,N,1));
m=100;
h=(X(N)-X(1))/m;
fn_t= @ (x) (sum(X<x)-sum(X<x-h))/(h*N);
for (i=1:m)
  vector_normcdf(i)=normcdf(X(1)+h*i,a,sigma);
endfor
for (i=2:m)
chi2=chi2+N*(fn_t(X(1)+h*i)*h-(vector_normcdf(i)-vector_normcdf(i-1))).^2/(vector_normcdf(i)-vector_normcdf(i-1));
endfor
if (chi2<chi2inv(0.95,100))
  error_count2=error_count2+1;
endif
endfor
printf('Propability=%d', error_count2/1000);
