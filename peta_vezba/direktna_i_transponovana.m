a = 1;
b = [1 -0.9744 0.024574 -0.97245 0.99601]; 
%definisanje parametara ulaznog signala  
fs = 44100;
f1 = 1102; 
f2 = 4586; 

%diskretno vreme
 n = 0 : 99; 
 %definisanje ulaznog signala u trajanju od 100 odbiraka
 u = 10*cos(2*pi*f1/fs*n)+1*cos(2*pi*f2/fs*n); 
 %odredjivanje odziva sistema na ulazni signal 
 y = filter (b, a, u); %crtanje ulaznog i izlaznog signala  
 subplot (2, 1, 1), stem (n, u), title ('Ulazni signal u trajanju od 100 odbiraka'); 
 subplot (2, 1, 2), stem (n, y), title ('Izlazni signal u trajanju od 100 odbiraka, racunat pomocu funkcije filter');
 %definisanje posebnog signala za potrebe simulacije u Simulinku 
 u_sim = [n;u]'; 