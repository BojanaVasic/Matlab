b = [1 -6 4]
a = [1 -1 0.33 -0.044 0.002]
nule = roots(b)
polovi = roots(a)
disp('Nule')
disp(nule)

disp('Polovi')
disp(polovi)

if abs(polovi) < 1 
    disp('Sistem je stabilan')
else
    disp('Sistem je nestabilan')
end
disp('Pojacanje')
k = b(1)/a(1);
disp(k)
zplane(b, a)
    