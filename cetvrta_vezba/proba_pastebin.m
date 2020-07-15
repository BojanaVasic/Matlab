wp1 = 3400/11200*pi;
wp2 = 7000/11200*pi;
ws1 = 2400/11200*pi;
ws2 = 8000/11200*pi;
as = 40;
ap = 1;
%korak 1: odredjivanje dw, wc, delta_s i delta_p
dw = min (wp1 - ws1, ws2 - wp2);
wc1 = wp1 - dw / 2;
wc2 = wp2 + dw / 2;
delta_s = 10 ^ (-0.05 * as);
delta_p = (10 ^ (0.05 * ap)-1)/(10 ^ (0.05 * ap)+1);
%korak 2: odredjivanje delta
delta = min (delta_s, delta_p);
if delta ~= delta_s
delta_s = -20*log10(delta);
end
%korak 3: odredjivanje beta
beta = 0;
if (as >= 21 & as <= 50)
beta = 0.5842*(as-21)^0.4+0.07886*(as-21);
end
if as > 50
beta = 0.1102*(as-8.7);
end
%korak 4: odredjivanje M
D = 0.9222;
if as > 21
D = (as-7.95)/14.36;
end
M = ceil (2*pi*D/dw+1);
%ukoliko je M paran dodaj jedan da bi smo dobili neparan broj
%ovo je neophodno da bi projektovani filtar imao celobrojno kasnjenje
if mod(M, 2) == 0
M = M + 1;
end;
%korak 5: generisanje odbiraka kajzerovog prozora duzine M
wk = kaiser (M, beta);
%korak 6: projektovanje FIR filtra
N = M-1; %potrebni red filtra
Wn = [wc1/pi wc2/pi]; %specifikacija nepropusnog opsega
b = fir1 (N, Wn, wk);
%racunanje spektra u 1024 tacke koriscenjem FFT
N_fft = 1024;
B = fft (b, N_fft);
%odredjivanje amplitudske karakteristike
Ba = abs(B(1:N_fft/2));
Bb = angle(B(1:N_fft/2));
%crtanje amplitudskih karakteristika na jednom grafiku
n = 0:N_fft/2-1;
w = n*pi/(N_fft/2-1);
subplot (4, 2, 5); plot (w, Ba); title ('Amplitudska k-ka PO filtra Kajzerovog prozora');
subplot (4, 2, 6); plot (w, Bb); title ('Fazna k-ka PO filtra Kajzerovog prozora');