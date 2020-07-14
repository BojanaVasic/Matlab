%zadatak 2.3 pod c
n = 0 : 99
h1 = [ones(1, 100)]
h2 = [zeros(1, 5) ones(1, 95)]
x1 = (-1/2) * n .* (h1-h2)
subplot(2, 2, 1), stem(n, x1);
x2 = (1/2) * n .* (h1-h2)
subplot(2, 2, 2), stem(n, x2);
x = conv(x1, x2)
subplot(2, 2, 3), stem(0 : length(x) -1 , x);