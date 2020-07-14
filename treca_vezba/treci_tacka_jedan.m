n = 0 : 127
% x = n * ( h(n) - h(n-16)) + (31- n) * (h(n-16) - h(n-32)) 
hev1 = [ones(1, 128)]
hev2 = [zeros(1, 16) ones(1, 112)]
hev3 = [zeros(1, 32) ones(1, 96)]

x = n .* (hev1 - hev2) + (31 - n) .* ( hev2 - hev3)
subplot(2, 2, 1), stem (n, x)

X =fftshift( fft(x))
subplot(2, 2, 2), stem (n, abs(X))

% pod b
x1 = 10000*cos(2*pi*35/128*n) + 100 * cos( 2 * pi * 40 /128 * n) + 100 * cos(2 * pi *60 /128 * n)
subplot(2, 2, 3), stem (n, x1)

X1 = fftshift(fft(x1, 2048))
subplot(2, 2, 4), stem (0 : length(X1) - 1, abs(X1))
