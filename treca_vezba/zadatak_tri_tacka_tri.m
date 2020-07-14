N = 128
n = 0 : 127
x = 10000 * cos(2 * pi *35.5 / 128 *n) +100 * cos (2 * pi * 40 /128 *n) + 100 * cos (2 * pi * 60 / 128 * n )
%crtanje ulaznog signala
subplot(3, 2, 1), stem(n, x)

%amplitudska karakteristika
X = 2*(abs (fft(x)))/ N;
X = 20 * log10(X)

%crtanje amplitudske karaktersitike
subplot(3, 2, 2), stem(n, X)

%prozorska funckija i njeno crtanje
w = triang(N)';
subplot(3, 2, 3), stem(n, w)
axis([0 140 0 2]);
y = x.*w
subplot(3, 2, 4), stem(n, y)
Y = 2*(abs(fft(y))) / N
Y = 20 * log10(Y)
subplot(3, 2, 5), stem(n, Y)

%Hanova  hanning
%Hamingova  hamming
%Blekmenova blackman
%Kajzerova(beta 4 i beta 9) kaiser (N, 4), kaiser(N, 9)