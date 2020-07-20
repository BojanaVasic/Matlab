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

rand_brojevi = -1 + 2.*rand(1,100) % 100 random brojeva od -1 do 1

%masinski brojevi
masinski_brojevi_q1 = quantize(q1, rand_brojevi)
masinski_brojevi_q2 = quantize(q2, rand_brojevi)
masinski_brojevi_q3 = quantize(q3, rand_brojevi)
masinski_brojevi_q4 = quantize(q4, rand_brojevi)

%greske masinskih brojeva i random brojeva
delta_q1 = masinski_brojevi_q1 -rand_brojevi;
delta_q2 = masinski_brojevi_q2 -rand_brojevi;
delta_q3 = masinski_brojevi_q3 -rand_brojevi;
delta_q4 = masinski_brojevi_q4 -rand_brojevi;
disp('random_br     mas_br_q1   greska_q1  mas_br_q2   greska_q2  mas_br_q3   greska_q3  mas_br_q4   greska_q4')
for i = 1 : 100
    disp( sprintf (' %6.3f      %6.3f      %6.3f      %6.3f      %6.3f      %6.3f      %6.3f      %6.3f      %6.3f ', rand_brojevi(i), masinski_brojevi_q1(i) , delta_q1(i), masinski_brojevi_q2(i) , delta_q2(i), masinski_brojevi_q3(i) , delta_q3(i), masinski_brojevi_q4(i) , delta_q4(i)))
    
end