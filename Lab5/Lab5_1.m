pkg load statistics

a=5;
sigma=sqrt(2);
N=10000;
m=100;
vector_means=[];
for (j=1:m)
x1=normrnd(a,sigma,N,1);
vector_means(j)=mean(x1);
endfor

mean_x1_p=std(vector_means)
mean_x1_t=sqrt(sigma^2/N)


vector_medians=[];
for (j=1:m)
x1=sort(normrnd(a,sigma,N,1));
if (mod(N, 2) == 1)
vector_medians(j)= x1((N+1)/2);
else 
vector_medians(j)=x1(N/2);
endif
endfor

median_x1_p=std(vector_medians)
median_x1_t=sqrt(pi*sigma^2 /(2*N))

vector_halfsum=[];
for (j=1:m)
x1=sort(normrnd(a,sigma,N,1));
vector_halfsum(j)=(x1(1)+x1(N))/2;
endfor

halfsum_x1_p=std(vector_halfsum)
halfsum_x1_t=sqrt(0.4*sigma^2/log(N))