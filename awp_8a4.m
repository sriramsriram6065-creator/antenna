clc;
clear;
close all;
%% Objective 1: Generate Desired Signal and EMI Sources
fs = 10000; % Sampling Frequency
t = 0:1/fs:0.01; % Time Vector
% Desired Communication Signal
A1 = 1;
f1 = 1000;
signal = A1*sin(2*pi*f1*t);
% EMI Source 1 (Sinusoidal Interference)
Aemi = 0.5;
femi = 2500;
emi_sine = Aemi*sin(2*pi*femi*t);
% EMI Source 2 (Broadband Noise)
emi_noise = 0.3*randn(size(t));
% EMI Source 3 (Impulse Noise)
emi_impulse = zeros(size(t));
emi_impulse(20:20:end) = 1;
% Total EMI
emi_total = emi_sine + emi_noise + emi_impulse;
% Received Signal
received = signal + emi_total;
%% Objective 2: Time Domain and Frequency Domain Analysis

N = length(received);
f = (-N/2:N/2-1)*(fs/N);
Signal_FFT = abs(fftshift(fft(signal)))/N;
EMI_FFT = abs(fftshift(fft(emi_total)))/N;
Received_FFT = abs(fftshift(fft(received)))/N;
%% Objective 3: SNR Analysis and EMI Mitigation
% Signal Power
Ps = mean(signal.^2);
% Noise Power Before Filtering
Pn_before = mean(emi_total.^2);
% SNR Before Filtering
SNR_before = 10*log10(Ps/Pn_before);
% Low Pass Filter
filtered = lowpass(received,1500,fs);
% Noise Power After Filtering
Pn_after = mean((filtered - signal).^2);
% SNR After Filtering
SNR_after = 10*log10(Ps/Pn_after);
%% Display Results
fprintf('\n---------------------------------\n');
fprintf(' EMI ANALYSIS RESULTS\n');
fprintf('---------------------------------\n');
fprintf('Signal Frequency = %d Hz\n',f1);
fprintf('EMI Frequency = %d Hz\n',femi);
fprintf('\nSignal Power = %.4f W\n',Ps);
fprintf('Noise Power Before = %.4f W\n',Pn_before);
fprintf('Noise Power After = %.4f W\n',Pn_after);
fprintf('\nSNR Before Filtering = %.2f dB\n',SNR_before);
fprintf('SNR After Filtering = %.2f dB\n',SNR_after);
fprintf('SNR Improvement = %.2f dB\n', ...
(SNR_after-SNR_before));
%% Plot Results
figure('Name','EMI Simulation and Analysis',...
'NumberTitle','off');
subplot(4,2,1)
plot(t,signal)
grid on
title('Desired Signal')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(4,2,2)
plot(t,emi_sine)
grid on
title('Sinusoidal EMI')

xlabel('Time (s)')
ylabel('Amplitude')
subplot(4,2,3)
plot(t,emi_noise)
grid on
title('Broadband EMI Noise')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(4,2,4)
stem(t,emi_impulse)
grid on
title('Impulse EMI')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(4,2,5)
plot(t,received)
grid on
title('Received Signal with EMI')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(4,2,6)
plot(f,Received_FFT)
grid on
title('Frequency Spectrum of EMI Signal')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
subplot(4,2,7)
plot(t,filtered)
grid on
title('Filtered Signal')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(4,2,8)
bar([SNR_before SNR_after])
grid on
title('SNR Comparison')
ylabel('SNR (dB)')
set(gca,'XTickLabel',{'Before','After'})
sgtitle('Simulation of EMI Sources and Interference Analysis using MATLAB')