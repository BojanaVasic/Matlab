%prvi
struct.mode = 'fixed'
struct.roundmode = 'floor'
struct.overflowmode = 'saturate'
struct.format = [4 3]
q1 = quantizer(struct)

%drugi
struct.mode = 'fixed'
struct.roundmode = 'floor'
struct.overflowmode = 'saturate'
struct.format = [8 7]
q2 = quantizer(struct)

%treci
struct.mode = 'fixed'
struct.roundmode = 'round'
struct.overflowmode = 'saturate'
struct.format = [4 3]
q3 = quantizer(struct)

%cetvrti
struct.mode = 'fixed'
struct.roundmode = 'round'
struct.overflowmode = 'saturate'
struct.format = [8 7]
q4 = quantizer(struct)

%realni brojevi u opsegu od -1 do 1
realni_brojevi = -1 : 0.05 : 1
masinski_brojevi_q1 = quantize(q1, realni_brojevi)
masinski_brojevi_q2 = quantize(q2, realni_brojevi)
masinski_brojevi_q3 = quantize(q3, realni_brojevi)
masinski_brojevi_q4 = quantize(q4, realni_brojevi)

plot(realni_brojevi, masinski_brojevi_q1, 'r')
hold on;
plot(realni_brojevi, masinski_brojevi_q2, 'b')
hold on;
plot(realni_brojevi, masinski_brojevi_q3, 'g')
hold on;
plot(realni_brojevi, masinski_brojevi_q4, 'k')
hold on;
ylabel('Masinski broj')
xlabel('Realni broj')
