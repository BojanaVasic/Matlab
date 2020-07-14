
x = [ones(1,8) zeros(1, 8)]
subplot(2, 2, 1), stem(0 : length(x)  - 1, x)

y1 = fft(x)
subplot(2, 2, 2), stem(0 : length(y1)  - 1, abs(y1))

y2 = fft(x, 64)
subplot(2, 2, 3), stem(0 : length(y2)  - 1, abs(y2))

figure
y1_shift = fftshift(y1)
subplot(2, 1, 1), stem(0 : length(y1_shift)  - 1, y1_shift)

y2_shift = fftshift(y2)
subplot(2, 1, 2), stem(0 : length(y2_shift)  - 1, y2_shift)