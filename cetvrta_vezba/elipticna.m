fsr = 11200
fp = 4500
fs = 3500
ap = 1
as = 40
[n Wn] = ellipord(fp/(fsr/2), fs/(fsr/2), ap, as)
[b, a] = ellip(n, ap, as, Wn, 'high')
freqz(b, a, 1024, fsr)

n = 0 : 1023 
x = cos(2 * pi * 1000  / fsr *n)  + cos(2 * pi * 3000 / fsr*n) + cos(2 * pi * 5000 / fsr*n)

figure
subplot(2, 1, 1), plot(n, x), title('pobuda')
xlim([0 100])

y = filter(b, a, x) %koeficijenti prenosne funckije i pobuda => odziv na pobudu preko funkcije filter
subplot(2, 1, 2), plot(1 : length(y), y) , title('pobuda')
xlim([0 100])