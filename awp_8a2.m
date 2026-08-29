N=length(received);
f=(-N/2:N/2-1)*(fs/N);
Spectrum=abs(fftshift(fft(received)));
figure;
plot(f,Spectrum);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum');
grid on;