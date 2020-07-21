a = [1 -3.234 4.1252 -2.4466 0.56748]
b = [0.010657 -0.00150 0.000146 0.008515 0.0006362 0.004425]
fs = 44100; f1 = 5900;
n = 0 : 99
u = 0.5+1*cos(2*pi*f1/fs*n)
y = filter(b, a, u)
subplot(2, 2, 1), plot(n, u), title('Ulaz')
subplot(2, 2, 2), plot(n, y), title('Izlaz')
nule = roots(b)
polovi = roots(a)
u_sim =[n ; u]'
n= 0 : 99 ;
subplot(2, 2, 1), stem(n, u), title('Ulaz');
subplot(2, 2, 2), stem(n, y), title('Izlaz');
subplot(2, 2, 3), stem(0 :length(y_kaskada') -1, y_kaskada'), title('Kaskada');
delta_kaskada = y - y_kaskada';
subplot(2, 2, 4), stem(n, delta_kaskada), title('Greska kaskada');