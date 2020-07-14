clear all
clc
 
N = 128;
n = 0:N-1;
 
%pod a)
 
figure(1);
 
x1 = 10000*cos(2*pi*35.5*n/N)+100*cos(2*pi*40*n/N)+100*cos(2*pi*60*n/N);
%Odredjivanje amplitudske karakteristike, pravougaoni prozor
X1 = abs(fft(x1));
X1 = 20*log10(X1);
subplot (3, 3, 1), stem(n, X1);
title('Sa pravougaonim prozorom');
axis([0 130 0 90]);