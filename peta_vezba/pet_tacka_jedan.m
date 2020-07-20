%FIR NF filtar,reda 5, fc = 2000, hanov prozor
fsr = 11200;
fc = 2000;
N = 5;
M = N+1;
hanov = hann(M);
%projektovanje filtra:
b = fir1 (N, fc/(fsr/2),hanov);
N_fft = 1024;
B = fft(b, N_fft);
Ba = abs(B (1:N_fft/2));
Bf = angle(B (1:N_fft/2));
%ampl i fazna karakteristika kao i odziv na ulazni signal:
n = 0 : N_fft/2-1;
f = n*(fsr/2)/(N_fft/2)-1;
subplot(4,1,1), plot (f,Ba),title('Amplitudska karakteristika');
subplot(4,1,2), plot(f,Bf),title('Fazna karakteristika');
%xlim([0 fsr/2]);
n = 0:99;
x = cos(2*pi*1000/11200*n) + cos(2*pi*3000/11200*n) + cos(2*pi*5000/11200*n);
y = filter(b,1,x);
subplot(4,1,3),plot(n,x),title('Ulazni signal');
subplot(4,1,4),plot(n,y),title('Izlazni signal');
figure;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SIMULINK
%b
n = 0:99;
u_sim = [n;x]';
subplot(2,2,1),stem(0:length(y)-1,y),title('Izlazni signal');

subplot(2,2,2),stem(0:length(y_sim_dir')-1,y_sim_dir'),title('Izlazni signal odredjen DIR formom');

%greska
delta_dir = y - y_sim_dir';
subplot(2, 2, 3), stem(0:length(delta_dir)-1, delta_dir)

figure
subplot(2, 2,1), stem(0 : length(y) - 1, y), title('Odziv')
subplot(2,2,2), stem(0 : length(y_sim_tran') -1, y_sim_tran'), title('Odziv preko trasnponovane forme')
delta_tran = y - y_sim_tran'
subplot(2,2,3), stem(0 : length(delta_tran) -1, delta_tran'), title('Greska')

delta_dir_tran = y_sim_dir' - y_sim_tran'
subplot(2,2,4), stem(0 : length(delta_dir_tran') -1,delta_dir_tran'), title('Greska dir -tran')


