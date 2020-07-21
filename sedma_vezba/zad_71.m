fsr = 11200
fn = 4000
N = 4
haming = hamming(N+1)
b = fir1(N, fn/ (fsr/2),  'high',haming)
N_fft = 1024
B = fft(b, N_fft)
B_amp = abs(B(1:(N_fft/2)))
B_faza = angle(B(1:(N_fft/2)))
n = 0 : (N_fft/2-1) % 0 - 511
f = n * (fsr/2) / (N_fft /2 - 1)  % 0 - 5600 sa korakom 10.95
subplot(2,4,1), plot(f ,20*log10 (B_amp)), title('Amplitudska karakteristika filtra');
subplot(2,4,2),  plot(f ,B_faza), title('Fazna karakteristika filtra');

n= 0: 99;
x = cos(2 * pi * (1000 / fsr) *n) +   cos(2 * pi * (3000 / fsr) *n)+cos(2 * pi * (5000 / fsr) *n)
y = filter(b, 1, x)
subplot(2,4,3), plot(n, x), title('Ulaz');
xlim([0 100])
subplot(2,4,4), plot(n, y), title('Izlaz');
xlim([0 100])

nule = roots(b)
disp(nule)
%zplane(b)
u_sim = [ n; x]';
n = 0:99;

subplot(2,4,3),  plot(n ,y_sim_dir'), title('Izlaz dir');
greska = y - y_sim_dir';
subplot(2,4,4),  plot(n ,greska), title('greska dir');


subplot(2,4,5),  plot(n ,y_sim_tran'), title('Izlaz tran');
greska = y - y_sim_tran';
subplot(2,4,6),  plot(n ,greska), title('greska');

subplot(2,4,7),  plot(n ,y_sim_kaskada'), title('Izlaz kaskada');
greska = y - y_sim_kaskada';
subplot(2,4,8),  plot(n ,greska), title('greska');

struct.mode = 'fixed'
struct.roundmode = 'round'
struct.overflowmode = 'saturate'
struct.format = [12 10]
q10 = quantizer(struct)

struct.mode = 'fixed'
struct.roundmode = 'round'
struct.overflowmode = 'saturate'
struct.format = [6 4]
q4 = quantizer(struct)

b_kvantizovano_10 = quantize(q10, b)
b_kvantizovano_4 = quantize(q4, b)

figure
N_fft = 1024
B_kvantizovano_10 = fft(b_kvantizovano_10, N_fft)
B_amp_kvan_10 = abs(B_kvantizovano_10(1:(N_fft/2)))
B_faza_kvan_10 = angle(B_kvantizovano_10(1:(N_fft/2)))
n = 0 : (N_fft/2-1) % 0 - 511
f = n * (fsr/2) / (N_fft /2 - 1)  % 0 - 5600 sa korakom 10.95
subplot(2,4,1), plot(f ,20*log10 (B_amp_kvan_10)), title('Amplitudska karakteristika kvantizovanog filtra - 10');
subplot(2,4,2),  plot(f ,B_faza_kvan_10), title('Fazna karakteristika kvantizovanog filtra- 10');


N_fft = 1024
B_kvantizovano_4 = fft(b_kvantizovano_4, N_fft)
B_amp_kvan_4 = abs(B_kvantizovano_4(1:(N_fft/2)))
B_faza_kvan_4 = angle(B_kvantizovano_4(1:(N_fft/2)))
n = 0 : (N_fft/2-1) % 0 - 511
f = n * (fsr/2) / (N_fft /2 - 1)  % 0 - 5600 sa korakom 10.95
subplot(2,4,3), plot(f ,20*log10 (B_amp_kvan_4)), title('Amplitudska karakteristika kvantizovanog filtra-4');
subplot(2,4,4),  plot(f ,B_faza_kvan_4), title('Fazna karakteristika kvantizovanog filtra-4');

figure
zplane(b_kvantizovano_4)
figure
zplane(b_kvantizovano_10)

