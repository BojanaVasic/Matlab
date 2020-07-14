n = 0 : 99;
b = [0.3 0.6 0.3]
a = [1 0.9 -0.3]
u1 = [ones(1, 100)]
u2 = [1 zeros(1, 99)]

i = filter(b, a, u1)
g =filter(b, a, u2)
subplot(3, 2, 1), stem(n, g);
title('Impulsni odziv');
subplot(3, 2, 2), stem(n, i);
title('Jedinicni odziv');

% g = i(n) - i(n-1)

g1 = i - [0 i(1:99)]
subplot(3, 2, 3), stem(n, g1);
title('Impulsni odziv na drugi nacin');

% i = g(1) + g(2) + ...+ g(100)
i1 = 0;
for k  =  1 : 100
   g_pom = [zeros(1, k-1)  g(1:100-k+1)] 
   i1 = i1 + g_pom
end  
subplot(3, 2, 4), stem(n, i1);
title('Jedinicni odziv na drugi nacin');   

g_greska = g - g1;
i_greska = i - i1;
subplot(3, 2, 5), stem(n, g_greska);
subplot(3, 2, 6), stem(n, i_greska);
