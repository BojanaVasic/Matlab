%pod d
%NO filtar
fsr = 11200; %dato u zadatku 
fp1=1500
fp2=2500 
fs1=1200
fs2=2800 
ap=1 
as = 40 

deltap = (10 ^ (0.05 * ap) - 1) / (10^(0.05*ap)+1);
deltas =  10 ^ (-0.05*as)
  % slabljenje u nepropusnom opsegu
f = [fs1 fp1 fp2 fs2]  % kljucne frekvencije
a = [0 1 0]   %pojacanje u sva tri intervala kod NO
dev = [ deltas deltap deltas ] %za svaki interval definisano

[N,fo,ao,w] = firpmord( f, a, dev, fsr); %funckija za odredjivanje cetiri parametra
b1 = firpm (N, fo, ao, w)
N = 5 ;
b = firpm (N, fo, ao, w) % koja potom koristimo za sintezu filtra
N_fft = 1024  
B = fft(b, N_fft)
n = 0 : N_fft / 2 - 1
f = n * (fsr/2) / (N_fft / 2 -1)  %zelimo da nam opseg ide od 0 do fsr/2
subplot(2, 2, 1), plot(f, abs(B(1 : N_fft/2))), title('AMPLITUDSKA')
F = angle(B(1 : N_fft/2))
subplot(2, 2, 2), plot(f, F), title('Fazna')
xlim([0 fsr/2])
n = 0 : 99;

x = cos(2 * pi *1000 / fsr*n) + cos(2 * pi *3000 / fsr*n)+cos(2 * pi *5000 / fsr *n)
u_sim = [n;x]';

y= filter(b1, 1, x)
figure 
delta_dir = y - y_sim_dir';
subplot(2, 2, 1), plot(1 : length(x), x), title('Pobuda');
subplot(2, 2, 2), plot(1 : length(y), y), title('Odziv');
subplot(2, 2, 3), stem(0 : length(y_sim_dir') -1, y_sim_dir'), title('Direktno');
subplot(2, 2, 4), stem(0 : length(delta_dir) -1, delta_dir), title('greska');
