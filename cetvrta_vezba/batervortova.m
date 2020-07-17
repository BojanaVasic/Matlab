fsr = 11200
fp = [500 4500]
fs = [1500 3500]
ap = 1
as = 40
[n, Wn] = buttord (fp / (fsr /2), fs / (fsr /2), ap, as)  %odredjivanje min reda filtra
[b, a] = butter(n, Wn, 'stop')  % sinteza filtra
freqz(b, a,1024, fsr) % amplitudska i fazna kakarakterisitika filtra

n = 0 : 1023 
x = cos(2 * pi * 1000  / fsr *n)  + cos(2 * pi * 3000 / fsr*n) + cos(2 * pi * 5000 / fsr*n)

figure
subplot(2, 1, 1), plot(n, x), title('pobuda')
xlim([0 100])

y = filter(b, a, x)
subplot(2, 1, 2), plot(1 : length(y), y) , title('pobuda')
xlim([0 100])