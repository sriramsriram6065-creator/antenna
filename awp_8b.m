clc;
clear;
close all;
%% Objective 1 : Shielding Effectiveness Simulation
f = logspace(6,9,1000); % 1 MHz to 1 GHz
mu0 = 4*pi*1e-7;
sigma = 5.8e7; % Copper conductivity
t = 1e-3; % Shield thickness
omega = 2*pi*f;
delta = sqrt(2./(omega*mu0*sigma));
A = 8.686*(t./delta); % Absorption Loss (dB)
%% Objective 2 : Reflection and Multiple Reflection Loss
sigma_r = 1;
mu_r = 1;
R = 168 - 10*log10((sigma_r)./(mu_r*f));
B = 5; % Approximate Multiple Reflection Loss
SE = R + A + B;
%% Objective 3 : EMC Compliance Analysis
EMC_Limit = 50*ones(size(f));
Measured_Emission = ...
    40 + 5*sin(2*pi*log10(f)/3);

Margin = EMC_Limit - Measured_Emission;
Compliance = Margin > 0;
%% Display Results
fprintf('\nSHIELDING EFFECTIVENESS RESULTS\n');
fprintf('---------------------------------\n');
fprintf('Maximum SE = %.2f dB\n',max(SE));
fprintf('Minimum SE = %.2f dB\n',min(SE));
if all(Compliance)
    fprintf('System is EMC COMPLIANT\n');
else
    fprintf('System is NOT EMC COMPLIANT\n');
end
%% Plot Results
figure('Name',...
    'Shielding Effectiveness and EMC Compliance',...
    'NumberTitle','off');
subplot(2,2,1)
semilogx(f,A,'LineWidth',2)
grid on
title('Absorption Loss')
xlabel('Frequency (Hz)')
ylabel('Loss (dB)')
subplot(2,2,2)
semilogx(f,R,'LineWidth',2)
grid on
title('Reflection Loss')
xlabel('Frequency (Hz)')
ylabel('Loss (dB)')
subplot(2,2,3)
semilogx(f,SE,'LineWidth',2)
grid on
title('Shielding Effectiveness')
xlabel('Frequency (Hz)')
ylabel('SE (dB)')
subplot(2,2,4)
semilogx(f,Measured_Emission,...
    'LineWidth',2)
hold on
semilogx(f,EMC_Limit,...
    'r--','LineWidth',2)
grid on

legend('Measured EMI',...
    'EMC Limit')
title('EMC Compliance Analysis')
xlabel('Frequency (Hz)')
ylabel('Emission Level (dBμV/m)')
