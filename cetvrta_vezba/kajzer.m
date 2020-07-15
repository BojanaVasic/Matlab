fs = 11200
ap = 1
as = 40
wp1 = 1700 / (fs/2) * pi;
wp2 = 3500 / (fs/2) * pi;
ws1 = 1200 / (fs/2) * pi;
wp1 = 4000 / (fs/2) * pi;

dw =min( wp1 - ws1, ws2 - ws1)
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
B = fft(b1, N_fft)
Ba = abs(B(1 : N_fft / 2))
n = 0 : N_fft / 2 -1 
f = n * pi / (N_fft / 2)

subplot(2, 2, 1), plot(f, 20* log10(Ba)), title('Amplitudska')
subplot(2, 2, 2), plot(f, angle(Ba)), title('Fazna')
   

    