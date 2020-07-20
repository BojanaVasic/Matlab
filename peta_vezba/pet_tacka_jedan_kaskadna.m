%FIR NF filtar,reda 5, fc = 2000, hanov prozor
fsr = 11200;
fc = 2000;
N = 5;
M = N+1;
hanov = hann(M);
%projektovanje filtra:
b = fir1 (N, fc/(fsr/2),hanov);
N_fft = 1024;
B = fft(b, N_fft);
Ba = abs(B (1:N_fft/2));
Bf = angle(B (1:N_fft/2));
%ampl i fazna karakteristika kao i odziv na ulazni signal:
n = 0 : N_fft/2-1;
f = n*(fsr/2)/(N_fft/2)-1;
subplot(4,1,1), plot (f,Ba),title('Amplitudska karakteristika');
subplot(4,1,2), plot(f,Bf),title('Fazna karakteristika');
%xlim([0 fsr/2]);
n = 0:99;
x = cos(2*pi*1000/11200*n) + cos(2*pi*3000/11200*n) + cos(2*pi*5000/11200*n);
y = filter(b,1,x);
subplot(4,1,3),plot(n,x),title('Ulazni signal');
subplot(4,1,4),plot(n,y),title('Izlazni signal');
u_sim = [n; x]';
koreni = roots(b)
figure 
subplot(2, 2 , 1), stem(0 :length(x) -1, x), title('Ulazni signal');
subplot(2, 2 , 2), stem(0 :length(y) -1, y), title('Izlazni signal');
subplot(2, 2 , 3), stem(0 :length(y_kaskada1') -1, y_kaskada1'), title('Kaskada');
delta_kaskada = y - y_kaskada1';
subplot(2, 2 , 4), stem(0 :length(delta_kaskada') -1, delta_kaskada'), title('greska');
