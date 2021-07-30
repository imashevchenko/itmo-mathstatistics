pkg load statistics

N=10000
a = 3;
alpha_=0.05;
sigma = 1;
k = 1.358;
c = 0.46;



i = 1:N;
count_kol = 0;
count_smir = 0;
for j=1:200
Fx = normcdf(sort(normrnd(a, sigma, N, 1)), a, sigma);
d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
if d>k 
  count_kol+=1;
endif
if w>c 
  count_smir+=1;
endif
endfor
printf("Вероятность ошибки первого рода Колмогорова: %d при alpha = %d \n", count_kol/200,alpha_)
printf("Вероятность ошибки первого рода Смирнова: %d при alpha = %d \n", count_smir/200,alpha_)

count_kol = 0;
count_smir = 0;
delta=0.04;
for j=1:200
Fx = normcdf(sort(normrnd(a-delta, sigma, N, 1)), a, sigma);

d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
if d<k 
  count_kol+=1;
endif
if w<c 
  count_smir+=1;
endif
endfor
printf("Вероятность ошибки второго рода Колмогорова: %d при alpha = %d при смещении параметра а на %d \n", count_kol/200,alpha_,delta)
printf("Вероятность ошибки второго рода Смирнова: %d при alpha = %d при смещении параметра а на %d \n", count_smir/200,alpha_,delta)
