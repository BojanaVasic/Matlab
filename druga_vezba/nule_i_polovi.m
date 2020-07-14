b = [3 -7 5]; 
a = [1 -5/2 1];
nule = roots(b);
polovi = roots(a);
disp('Nule funkcije prenosa')
disp(nule)

disp('Polovi funkcije prenosa')
disp(polovi)

if abs(polovi) < 1 
    disp('Sistem je stabilan')
else
    disp('Sistem je nestabilan')
end
zplane(b, a);