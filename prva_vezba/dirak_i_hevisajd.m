% h(n) - h(n-2) + 1.5*h(n+3)    -7<n<9


n = -6 : 8;
hevisajd1 = [zeros(1, 6) ones(1, 9)]
figure
subplot(2, 2, 1), stem(n, hevisajd1)  

hevisajd2 = [zeros(1, 8) ones(1, 7)]
subplot(2, 2, 2), stem(n, hevisajd2) 

hevisajd3 = [zeros(1, 3) ones(1, 12)]

subplot(2, 2, 3), stem(n, hevisajd3) 

hevisajd_rez = hevisajd1 - hevisajd2 + 1.5* hevisajd3
subplot(2, 2, 4), stem(n, hevisajd_rez) 

% 5*dirak(n+2)   -6 <n<2
n = -5 : 1
dirak = [zeros(1, 3) 1 zeros(1, 3)]
figure
subplot(1, 1,1), stem (n, 5*dirak) 
