pkg load statistics

N=1000000
a = 0;
b = 8;
k = 1.358;
c = 0.46;
alpha=0.05;


i = 1:N;
count_kol = 0;
count_smir = 0;
for j=1:200
Fx = unifcdf(sort(unifrnd(a, b, N, 1)), a, b);

d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
if d>k 
  count_kol+=1;
endif
if w>c 
  count_smir+=1;
endif
endfor
printf("Вероятность ошибки первого рода Колмогорова: %d при alpha = %d \n", count_kol/200,alpha)
printf("Вероятность ошибки первого рода Смирнова: %d при alpha = %d \n", count_smir/200,alpha)

count_kol = 0;
count_smir = 0;
delta=0.05;
i = 1:N;
for j=1:200
Fx = unifcdf(sort(unifrnd(a+delta, b+delta, N,1)), a, b);

d = sqrt(N) * max(max(abs(Fx'(i) - i/N)), max(abs(Fx'(i) - (i-1)/N)));
w = 1/(12*N) + sum((Fx'(i)-(2*i-1)/(2*N)).^ 2);
if d<k 
  count_kol+=1;
endif
if w<c 
  count_smir+=1;
endif
endfor
printf("Вероятность ошибки второго рода Колмогорова: %d при alpha = %d при смещении параметра а и b на %d \n", count_kol/200,alpha,delta)
printf("Вероятность ошибки второго рода Смирнова: %d при alpha = %d при смещении параметра а и b на %d \n", count_smir/200,alpha,delta)
