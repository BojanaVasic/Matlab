fsr = 11200
fp=4500
fs=3500
ap=1
as=40
[N,Wp] = ellipord(fp / (fsr/2), fs / (fsr/2), ap, as) 
[b,a] = ellip(N, ap, as, Wp, 'high'); 
freqz(b, a, 1024, fsr)

figure
n= 0: 99;
x = cos(2 * pi * (1000 / fsr) *n) +   cos(2 * pi * (3000 / fsr) *n)+cos(2 * pi * (5000 / fsr) *n)
y = filter(b, a, x)
subplot(2,4,1), plot(n, x), title('Ulaz');
xlim([0 100])
subplot(2,4,2), plot(n, y), title('Izlaz');
xlim([0 100])

u_sim = [n;x]';
subplot(2,4,3), plot(n, y_dir_1'), title('Izlaz dir 1');
delta_dir_1 = y - y_dir_1'
subplot(2,4,4), plot(n, delta_dir_1), title('Greska dir 1');

subplot(2,4,5), plot(n, y_dir_2'), title('Izlaz dir 2');
delta_dir_2 = y - y_dir_2'
subplot(2,4,6), plot(n, delta_dir_2), title('Greska dir 2');

subplot(2,4,7), plot(n, y_tran_1'), title('Izlaz tran 1');
delta_tran_1 = y - y_tran_1'
subplot(2,4,8), plot(n, delta_tran_1), title('Greska tran 1 ');

figure
subplot(1,3,1), plot(n, y), title('Izlaz');
delta_tran_2 = y - y_tran_2'
subplot(1,3,2), plot(n, y_tran_2'), title('Izlaz tran 2');
subplot(1, 3, 3), plot(n, delta_tran_2), title('Greska tran 2 ');

nule = roots(b)
polovi = roots(a)
blok_b1 = b(1) * conv([1 -nule(1)], [1 -nule(2)])
blok_b2 = conv([1 -nule(3)], [1 -nule(4)])

blok_a1 = 1* conv([1 -polovi(1)], [1 -polovi(2)])
blok_a2 = conv([1 -polovi(3)], [1 -polovi(4)])

figure
subplot(2,3,1), plot(n, y'), title('Izlaz ');
delta_kaskada = y - y_kaskada'

subplot(2,3,2), plot(n, y_kaskada'), title('Izlaz kaskada');
subplot(2,3,3), plot(n, delta_kaskada), title('Greska kaskada ');

struct.mode = 'fixed'
struct.roundmode = 'round'
struct.overflowmode = 'saturate'
struct.format = [8 6]
q6 = quantizer(struct)

struct.mode = 'fixed'
struct.roundmode = 'round'
struct.overflowmode = 'saturate'
struct.format = [18 16]
q16 = quantizer(struct)

b_kvan_6 = quantize(q6, b)
a_kvan_6 = quantize(q6, a)
freqz(b_kvan_6, a_kvan_6, 1024, fsr)

b_kvan_16 = quantize(q16, b)
a_kvan_16 = quantize(q16, a)
freqz(b_kvan_16, a_kvan_16, 1024, fsr)

figure
subplot(1,3,1), plot(n, y), title('Izlaz');
subplot(1,3,2), plot(n, y_kvan'), title('Kvantizovan ');
delta = y - y_kvan'
subplot(1,3,3), plot(n, delta), title('Greska Kvantizacije ');

figure
zplane(b_kvan_6, a_kvan_6)

y_fft = fft(y, 1024)
Py = sum (y_fft .* conj(y_fft) / (1024^2))

delta_dir_fft = fft(delta_dir_1, 1024)
Pdelta_dir = sum (delta_dir_fft .* conj(delta_dir_fft) / (1024^2))

delta_fft = fft(delta, 1024)
Pdelta_kvan = sum (delta_fft .* conj(delta_fft) / (1024^2))

SNR_delta_dir_1 = 10*log10(Py / Pdelta_dir)
SNR_delta_kvan = 10*log10(Py / Pdelta_kvan)


