pkg load statistics;

a=3;
k=5;
c=0.94;
gamma=0.95;
n=10^4
T=norminv((gamma+1)/2);

x=rand(n,k);
f=exp(-a*x);
z=sum(f,2);
p=mean(z<c)
d=T*sqrt(p*(1-p)/n)
In=[p-d;p+d]

a=3;
k=5;
c=0.94;
gamma=0.95;
n=10^6
T=norminv((gamma+1)/2);

x=rand(n,k);
f=exp(-a*x);
z=sum(f,2);
p=mean(z<c)
d=T*sqrt(p*(1-p)/n)
In=[p-d;p+d]
