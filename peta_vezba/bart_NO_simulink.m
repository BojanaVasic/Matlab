 fsr=11200   
fp1 = 500
fp2 = 4500
fs1 = 1500
fs2 = 3500 
ap = 1 
as = 40 
fp = [fp1/(fsr/2) fp2/ (fsr/2)]
fs = [fs1/ (fsr/2) fs2/ (fsr/2)]
[N,Wn] = buttord(fp,fs,ap,as);  
disp('N *****')
disp(N)
[b,a] = butter(N,Wn, 'stop');
disp(b)
disp(a)
freqz(b,a,1024,fsr);
n = 0 : 99;
x = cos(2 * pi *1000 / fsr*n) + cos(2 * pi *3000 / fsr*n)+cos(2 * pi *5000 / fsr*n)
subplot(2, 1, 1), plot(n, x), title('Pobuda')
y  = filter(b, a, x)
subplot(2, 1, 2), plot(0 : length(y) - 1, y), title('Odziv')
