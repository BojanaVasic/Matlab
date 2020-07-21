fsr = 22050; 
%Specifikacija NF FIR filtra 
fp = 3000;
fs = 6000; 
ap = 1; 
as = 40; 
%Projektovanje NF FIR filtra 
f = [fp fs];
a = [1 0]; 
dev = [(10^(ap/20)-1)/(10^(ap/20)+1) 10^(-as/20)];
%odredjivanje dozvoljenih odstupanja za svaki opseg
[n, fo, ao, w] = firpmord (f, a, dev, fsr);
b_nf = firpm (n, fo, ao, w); 
 
%diskretno vreme 

n = 0 : 11; 
%definisanje ulaznog signala u trajanju od 100 odbiraka 
u = [1 zeros(1,11)]; 
%odredjivanje impulsnog odziva sistema
y = filter (b_nf, 1, u); %definisanje posebnog signala za potrebe simulacije u Simulinku
u_sim = [n;u]'; 
 
%odredjivanje koeficijenata za kaskadnu realizaciju
zo = roots (b_nf);
sec1 = conv ([1 -zo(1)], [1 -zo(2)]); 
sec2 = conv ([1 -zo(3)], [1 -zo(4)]); 
sec3 = conv ([1 -zo(5)], [1 -zo(6)]);
sec4 = conv ([1 -zo(7)], [1 -zo(8)]); 
sec5 = b_nf(1)*[1 -zo(9) 0]; 
