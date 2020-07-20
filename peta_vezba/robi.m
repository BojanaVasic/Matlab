fsr = 11200;
fp1 = 1500;
fp2 = 2500;
fs1 = 1200;
fs2 = 2800;
ap = 1;
as = 40;
%projektovanje filtra:
f = [fs1 fp1 fp2 fs2];
a = [0 1 0];
dev = [(10^(-as/20)) (10^(ap/20)-1)/(10^(ap/20)+1) (10^(-as/20))];
[N,fo,ao,w] = firpmord(f,a,dev,fsr);
b = firpm(N,fo,ao,w,'pass');
%ampl. i fazna karakteristika
N_fft = 1024;
B = fft(b,N_fft);
Ba = abs(B(1:N_fft/2));
Bf = angle(B(1:N_fft/2));
n = 0:N_fft/2 -1;
f = n*(fsr/2)/(N_fft/2 -1);
subplot(2,1,1),plot(f,Ba),title('Ampludka karakteristika');
subplot(2,1,2),plot(f,Bf),title('Fazna karakteristika');
%odziv na uazni signal:
n = 0:99;
x = cos(2*pi*1000/11200*n) + cos(2*pi*3000/11200*n) + cos(2*pi*5000/11200*n);
y = filter(b,1,x);
subplot(2,1,1),plot(n,x),title('Ulaz');
subplot(2,1,2),plot(n,y),title('Izlaz');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%simulink
u_sim = [n;x]';
b
subplot(4,1,1),stem(0:length(y)-1,y),title('Izlaz rcunat preko "filter"');
%subplot(4,1,2),stem(0:length(y)-1,y_dir'),title('Izlaz DIREKTNA FORMA');
    %stem(0:length(y)-1,y-y_dir'),title('GRESKA y - y_dir');
%subplot(4,1,3),stem(0:length(y)-1,y_tran'),title('Izlaz TRANSPONOVANA FORMA');
    %stem(0:length(y)-1,y-y_tran'),title('GRESKA y - y_tran');
%KASKADNA REALIZACIJA:
%roots(b)
%subplot(4,1,4),stem(0:length(y)-1,y_kas'),title('Izlaz KASKADNA FORMA');
    %stem(0:length(y)-1,y-y_kas'),title('GRESKA y - y_kas');
