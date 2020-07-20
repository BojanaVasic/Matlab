a = 1; 
b = [1 -0.73205 0.26795 0.26795 -0.73205 1]; 
freqz(b, 1);
%definisanje parametara ulaznog signala 
fs = 44100; 
f1 = 882;
f2 = 3660; 
f3 = 11025;
%diskretno vreme 
n = 0 : 99; %definisanje ulaznog signala u trajanju od 100 odbiraka 
u = 1*cos(2*pi*f1/fs*n)+2*cos(2*pi*f2/fs*n)+2*cos(2*pi*f3/fs*n);
%odredjivanje odziva sistema na ulazni signal
y = filter (b, a, u); %crtanje ulaznog i izlaznog signala  
subplot (2, 1, 1), stem (n, u), title ('Ulazni signal u trajanju od 100 odbiraka');
subplot (2, 1, 2), stem (n, y), title ('Izlazni signal u trajanju od 100 odbiraka, racunat pomocu funkcije filter');
%definisanje posebnog signala za potrebe simulacije u Simulinku 
u_sim = [n;u]'; 

polovi = roots([1 -0.73205 0.26795 0.26795 -0.73205 1])
k1 = 1
k2 = 0
k3 = 1
k4 = 1
k5 = -1.73205
k6 = 1
k7 = 1
k8 = 1
k9 = 0 
