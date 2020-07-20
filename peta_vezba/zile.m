%a)
fs = 11200
fg = 2000
N = 5
M = N + 1
han = hann(M)

b = fir1(N,fg/(fs/2),han)

N_fft = 1024
B = fft(b,N_fft)

n = 0 : N_fft/2 - 1
w = n*(fs/2)/(N_fft/2-1)

Ba = abs(B(1:N_fft/2))
Bf = angle(B(1:N_fft/2))

subplot(2,1,1)
plot(w,Ba)
title('Amplitudska karakterisitika')

subplot(2,1,2)
plot(w,Bf)
title('Fazna karakteristika')

n = 0 : 99
x = 2*cos(2*pi*(1000/fs)*n) + cos(2*pi*(3000/fs)*n) + cos(2*pi*(5000/fs)*n)

y = filter(b,1,x)    % kod fir sistema,a=1

figure
subplot(2,1,1)
plot(0:length(x)-1,x)
title('Ulazni signal')
xlim([0 100])
    

subplot(2,1,2)
plot(0 : length(y)-1,y)
title('Izlazni signal')
xlim([0 100])


x_sim = [n;x]'

simulink

figure

subplot(3,1,1)
plot(0 : length(y)-1,y)
title('Izlazni signal-filter')


subplot(3,1,2)
plot(0:length(y_sim')-1,y_sim')
title('Izlaz iz simulinka')
ylim([-5 5])

delta = y - y_sim'

subplot(3,1,3)
stem(0 : length(delta)-1,delta)
title('Greska ova dva pristupa')

delta1 = y - y_tra'


figure
subplot(2,1,1)
stem(0 : length(delta1)-1,delta1)
title('Greska ova dva pristupa-trans forma')
