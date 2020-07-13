Ak = [10 4 7];
fk = [100 1500 2500]
tk = 0 : 0.000001: 0.02;
Xk = Ak(1)*cos(2*pi*fk(1)*tk) - Ak(2)*cos(2*pi*fk(2)*tk) + Ak(3)*sin(2*pi*fk(3)*tk)
subplot(2, 1, 1), plot(tk, Xk, 'k')

P = Ak.*Ak / 2;
Psum = sum(P)
Pproc = P / Psum

fmax = 2 * 2500;
Ts = 1/ fmax;
 td = 0 : Ts: 0.05;
 Xd = Ak(1)*cos(2*pi*fk(1)*td) + Ak(3)*sin(2*pi*fk(3)*td)
 subplot(2, 1, 2), stem(0 : length(td) - 1, Xd); 
 
