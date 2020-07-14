% zadatak 2.6 pod a

b = [1]
a = [1 -2.3 2.3756 -1.33 0.3989 -0.0589 0.0033]
polovi = roots(a);
if abs(polovi) < 1 
    disp('Sistem je stabilan')
else
    disp('Sistem je nestabilan')
end 
zplane(b, a)   
 