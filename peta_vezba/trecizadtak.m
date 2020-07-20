a = [1 -3.234 4.1252 -2.4466 0.56748]
b = [0.010657 -0.00150 0.000146 0.008515 0.0006362 0.004425]
fs = 44100; f1 = 5900;
n = 0 : 99
u = 0.5+1*cos(2*pi*f1/fs*n)
y = filter(b, a, u)
subplot(2, 2, 1), plot(n, u), title('Ulaz')
subplot(2, 2, 2), plot(n, y), title('Izlaz')
u_dir_1 = [n; u]'
delta_dir_1 = y - y_dir_1'
subplot(2, 2, 3), plot(n, y_dir_1'), title('Izlaz dir 1')

subplot(2, 2, 4), plot(n, delta_dir_1'), title('Greska dir 1')
figure
delta_dir_2 = y - y_dir_2'
subplot(2, 2, 1), plot(n, y_dir_2'), title('Izlaz dir 2')
subplot(2, 2, 2), plot(n, delta_dir_2'), title('Greska dir 2')

delta_tran_1 = y - y_tran_1'
subplot(2, 2, 3), plot(n, y_tran_1'), title('Izlaz tran 1')
subplot(2, 2, 4), plot(n, delta_tran_1'), title('Greska tran 1')

delta_tran_2 = y - y_tran_2'
figure
subplot(2, 1, 1), plot(n, y_tran_2'), title('Izlaz tran 2')
subplot(2, 1, 2), plot(n, delta_tran_2'), title('Greska tran 2')

