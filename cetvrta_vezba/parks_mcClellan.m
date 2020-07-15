%pod d
%NO filtar
fsr = 11200; %dato u zadatku 
fp1 = 3500 
fp2 = 4500 ;
fs1 = 3800;
fs2 = 4100 ;
ap1 = 1  %slabljenje u prvom opsegu
ap2 = 1  % slabljenje u drugom opsegu
as = 40  % slabljenje u nepropusnom opsegu
f = [fp1 fs1 fs2 fp2]  % kljucne frekvencije
a = [1 0 1]   %pojacanje u sva tri intervala kod NO
dev = [ (10 ^ (0.05 * ap1) - 1) / (10^(0.05*ap1)+1)  10 ^ (-0.05*as)  (10 ^ (0.05 * ap2) - 1) / (10^(0.05*ap2)+1) ] %za svaki interval definisano
[n,fo,ao,w] = firpmord( f, a, dev, fsr); %funckija za odredjivanje cetiri parametra
b = firpm (n, fo, ao, w) % koja potom koristimo za sintezu filtra
N_fft = 1024  
B = fft(b, N_fft)
n = 0 : N_fft / 2 - 1
f = n * (fsr/2) / (N_fft / 2 -1)  %zelimo da nam opseg ide od 0 do fsr/2
subplot(2, 2, 1), plot(f, abs(B(1 : N_fft/2))), title('AMPLITUDSKA')
axis([0 fsr/2 0 1.2])