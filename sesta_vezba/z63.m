 fsr= 11200
fs=1500
fp=2500
ap=1
as=40
f = [fs fp]
deltap = (10^(ap/20)-1)/(10^(ap/20)+1) 
deltas = 10^(-as/20);
dev = [deltas deltap]
a = [0 1]
[n,fo,ao,w] = firpmord( f, a, dev, fsr); 

b = firpm (n, fo, ao, w)
freqz(b,1,1024,fsr)

n = 0 : 99
x = cos(2 * pi *1000 /fsr *n) +cos(2 * pi *3000 /fsr *n) +cos(2 * pi * 5000 /fsr *n) ;
figure
subplot(2,2,1), stem(n, x), title('Pobuda')
y= filter(b, 1, x)
subplot(2,2,2), stem(n, y), title('Izlaz bez kvantizera')

struct.mode = 'fixed'
struct.roundmode = 'floor'
struct.overflowmode = 'saturate'
struct.format = [4 3]
q1 = quantizer(struct)

struct.mode = 'fixed'
struct.roundmode = 'round' 
struct.overflowmode = 'saturate'
struct.format = [4 3]
q2 = quantizer(struct)
x_q1 = quantize(q1, x)
x_q2 = quantize(q2, x)
y_q1 = filter(b, 1, x_q1)
y_q2 = filter(b, 1, x_q2)
subplot(2,2,3), stem(n, y_q1), title('Izlaz sa prvim kvantizerom')
subplot(2,2,4), stem(n, y_q2), title('Izlaz sa drugim kvantizerom')



