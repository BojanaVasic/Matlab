N = 25;
hanov = hann(N + 1);
fn = 2000;
fs = 11200;
b1 = fir1(N, fn / (fs/2), hanov)  %sinteza filtra

N_fft = 1024;
B1 = fft(b1, N_fft) ;
B1a = abs(B1(1 : N_fft / 2));
F = angle(B1(1:N_fft/2)); %fazna
%frekvencijska osa
N_fft1 = N_fft / 2 -1; % posmatramo pola
n = 0 : N_fft1;
f = n * (fs/2) /  N_fft1; %frekvencijaska osa je skalirana od nula do (fs/2)

%crtamo filtar
subplot(2, 2, 1), plot(f, 20*log10(B1a)), title('NF filtar- Amplitudska');
subplot(2, 2, 2), plot(f, F), title('NF - Fazna');
%ulazni signal
N_fft = 1024;
n = 0 : N_fft - 1;
x = cos(2 * pi * 1000 / fs * n) + cos(2 * pi * 3000 / fs * n) + cos(2 * pi * 5000 / fs * n) ;

%furijeova transformacija pobudnog signala
X = fft(x, N_fft)
subplot(2, 2, 3), plot(n, 20*log10(X)), title('Pobudni signal, amplitudska karakterisitika')

Y = X .* B1
y = ifft(Y)
subplot(2, 2, 4), plot(1 : length(y), y), title('Pobudni signal, amplitudska karakterisitika')
xlim([0 50])
