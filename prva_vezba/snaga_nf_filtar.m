
%snaga

Tmax = 0.2;
fk = [100 1500 2500];
Ak = [10 4 3];
tk = 0 : 0.00001: Tmax;
Xk = Ak(1) * cos( 2 * pi* fk(1) * tk) - Ak(2) * cos( 2 * pi* fk(2) * tk) + Ak(3) * sin( 2 * pi* fk(3) * tk) ;
figure
subplot(2, 1, 1), plot(tk, Xk, 'k')
Pk = Ak.*Ak / 2
Ptotal = sum(Pk)
Pperc = Pk / Ptotal
fmax = 1500
fs = 2 * fmax
Ts = 1 / fs;
td = 0: Ts : Tmax
Xd = Ak(1) * cos( 2 * pi* fk(1) * td) - Ak(2) * cos( 2 * pi* fk(2) * td)
subplot (2, 1, 2), stem (0 : length(td) - 1, Xd)


