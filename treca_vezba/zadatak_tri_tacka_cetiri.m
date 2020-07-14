% zadatak 3.5

fs =  48000
f1 = 500
f2 = 12000
n = 0 : 255;
b = [0.1094 0.1094 0.1094 0.1094]
a  = [0.96875 -1 0.96875 -0.53125]
delta = [1 zeros(1, 255)]
u = sin ( 2* pi* f1 /fs * n) + 0.1* sin (2* pi * f2 / fs * n)
subplot(2, 2, 4), stem(n, u)
g = filter(b, a, delta)
y3 = filter(b, a, u)


w = 2 * pi * f1 / fs
G = (0.1094 + 0.1094*exp(-i*w) + 0.1094*exp(-i*2*w) + 0.1094 * exp(-i*3*w)) ./ (0.96875 - 1 * exp(-i*w) + 0.96875*exp(-2*i*w) -0.53125*exp(-3*i*w))

A1 = abs(G)
F1 = angle(G)

w = 2 * pi * f2 / fs
A2 = abs(G)
F2 = angle(G)

y2 = conv(g, u)
subplot(2, 2, 1),   stem(0 : length(y2) - 1, y2)
title('Odziv preko impulsnog odziva')
xlim([0 300])

y1 = A1 * sin (2*pi*f1/fs*n + F1) + 0.1 * A2 * sin (2*pi*f2/fs*n + F2)
subplot(2, 2, 2), stem(n, y1)
title('Odziv preko amplitudske i fazne')

subplot(2, 2 , 3), stem(n, y3)
title('Odziv dobijen resavanjem rui-a')


y_greska = y3 - y1;
figure
subplot (2, 1, 1), stem (0 : length(y_greska) - 1 , y_greska); title ('Greska izmedju dva pristupa');


