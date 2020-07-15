fs = 11200
ap = 1
as = 40
wp1 = 1700 * pi / (fs/2) ;
wp2 = 3500 * pi / (fs/2);
ws1 = 1200 * pi / (fs/2) ;
ws2 = 4000 * pi / (fs/2) ;

dw = min(wp1 - ws1, ws2 - wp2)
wc1 = wp1 - dw / 2
wc2 = wp2 + dw / 2
deltas =  10 ^ (-0.05 * as)
deltap = (10 ^ (0.05 * ap) - 1) / (10 ^ (0.05 * ap) + 1)
delta = min(deltas, deltap)
if delta ~= deltas 
    as = -20 * log10(delta)
end

%beta
beta = 0;
if (as > 21 & as <= 50)
    beta = 0.5842 * (as -21) ^ 0.4 + 0.07886 * (as - 21)
end
if (as > 50)
    beta = 0.1102 * (as - 8.7)
end
%M
D = 0.9222
if (as > 21)
    D = (as - 7.95) / 14.36
end
M = ceil(2 * pi * D / dw + 1)
if (mod(M, 2) == 0)
    M = M + 1;
end
kajzer = kaiser(M, beta)
N = M -1 ;

%sinteza filtra
Wn = [wc1/ pi wc2/pi]
b = fir1(N, Wn, kajzer)
N_fft = 1024
B = fft(b, N_fft)
Ba = abs(B(1 : N_fft / 2))
F = angle(B(1:N_fft /2))
n = 0 : N_fft / 2 -1 
f = n * pi / (N_fft / 2)

subplot(2, 2, 1), plot(f, (Ba)), title('AMPLITUDSKA')
subplot(2, 2, 2), plot(f, F), title('Fazna')

N_fft = 1024
n = 0 : N_fft - 1;
x = cos(2 * pi * 1000 / fs * n) + cos(2 * pi * 3000 / fs * n) + cos(2 * pi * 5000 / fs * n) 
X = fft(x, N_fft)
subplot(2, 2, 3), plot(n, X), title('Pobuda')

Y = X .* B
y = ifft(Y)
subplot(2, 2, 4), plot(1 : length(y), y) ,  title('Odziv')
xlim([0 400])

    