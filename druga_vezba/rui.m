%a
n = 0 : 99
b1 = [1]
a1 = [1 -1]
hev1 = [ones(1,100)]
hev2 = [zeros(1, 5) ones(1, 95)]
hev = hev1 - hev2;
u1 =  (2) .^ n .* hev;
subplot(3, 2, 1), stem(n, u1);
y1 = filter(b1, a1, u1)
subplot(3, 2 ,2), stem(n, y1);

%b
 b2 = [1]
 a2 = [1 -4]
 u2 = hev1
 subplot(3, 2, 3), stem(n, u2);
 y2=filter(b2, a2, u2) 
 subplot(3, 2 ,4), stem(n, y2);
 
 %c
 b3 = [ 0.1094 0.1094 0.1094 0.1094]
 a3 = [ 0.96875 -1 0.96875 -0.53125]
 u3 = sin(2*pi*500*n/48000) + 0.1 * sin(2*12000*pi*n/48000)
 subplot(3, 2, 5), stem(n, u3);
 y3=filter(b3, a3, u3) 
 subplot(3, 2 ,6), stem(n, y3);