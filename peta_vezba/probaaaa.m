a = [1 -3.234 4.1252 -2.4466 0.56748];
b = [0.010657 -0.001501 0.000146 0.0085151 0.0006362 0.0044251]; 
%definisanje parametara ulaznog signala 
fs = 44100; f1 = 5900;
%diskretno vreme
n = 0 : 99; %definisanje ulaznog signala u trajanju od 100 odbiraka 
u = 0.5+1*cos(2*pi*f1/fs*n);
%odredjivanje odziva sistema na ulazni signal 
y = filter (b, a, u); %crtanje ulaznog i izlaznog signala  
subplot (2, 1, 1), plot (n, u), title ('Ulazni signal u trajanju od 100 odbiraka');
subplot (2, 1, 2), plot (n, y), title ('Izlazni signal u trajanju od 100 odbiraka, racunat pomocu funkcije filter'); 