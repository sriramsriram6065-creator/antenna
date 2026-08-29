Ps=mean(signal.^2);
Pn=mean(emi.^2);
SNR_before=10*log10(Ps/Pn);
filtered=lowpass(received,1500,fs);
Pn_after=mean((filtered-signal).^2);
SNR_after=10*log10(Ps/Pn_after);
fprintf('SNR Before =%.2f dB\n',SNR_before);
fprintf('SNR After = %.2f dB\n',SNR_after);