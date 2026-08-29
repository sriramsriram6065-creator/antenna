clc;
clear;
close all;
%% Objective 1 : Critical Frequency Analysis
Nmax = 0.1:0.05:1.0; % Electron Density (10^12 electrons/m^3)
fc = 9*sqrt(Nmax); % Critical Frequency (MHz)
%% Objective 2 : MUF Analysis
theta = 0:1:70; % Angle of Incidence (degrees)
fc_fixed = 6.3; % MHz
MUF = fc_fixed*sec(deg2rad(theta));
%% Objective 3 : Comparative Analysis
MUF_ratio = MUF/fc_fixed;
%% Display Results
fprintf('\nCRITICAL FREQUENCY AND MUF ANALYSIS\n');
fprintf('-------------------------------------\n');
fprintf('Critical Frequency = %.2f MHz\n',fc_fixed);
fprintf('MUF at 60 Degree = %.2f MHz\n',...
    fc_fixed*sec(deg2rad(60)));
%% Plot Results
figure('Name',...
    'Critical Frequency and MUF Analysis',...
    'NumberTitle','off');
subplot(2,2,1)
plot(Nmax,fc,'LineWidth',2)
grid on
xlabel('Electron Density (10^{12} electrons/m^3)')
ylabel('Critical Frequency (MHz)')

title('Critical Frequency vs Electron Density')
subplot(2,2,2)
plot(theta,MUF,'LineWidth',2)
grid on
xlabel('Angle of Incidence (Degree)')
ylabel('MUF (MHz)')
title('MUF vs Angle of Incidence')
subplot(2,2,3)
plot(theta,MUF_ratio,'LineWidth',2)
grid on
xlabel('Angle of Incidence (Degree)')
ylabel('MUF/fc')
title('MUF Ratio')
subplot(2,2,4)
plot(theta,MUF,'r','LineWidth',2)
hold on
yline(fc_fixed,'b--','LineWidth',2)
grid on
legend('MUF','Critical Frequency')
xlabel('Angle (Degree)')
ylabel('Frequency (MHz)')
title('Comparison of fc and MUF')