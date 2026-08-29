clc;
clear;
close all;
%% Objective 1 : Skip Distance Analysis
h = 250; % Ionospheric Height (km)
theta = 10:1:70; % Angle of Incidence
Skip_Distance = 2*h*tand(theta);
%% Objective 2 : Tropospheric Propagation
ht = 100; % Transmitter Height (m)
hr = 50; % Receiver Height (m)
LOS_Distance = 4.12*(sqrt(ht)+sqrt(hr));
%% Objective 3 : Comparative Analysis
Coverage_Ratio = Skip_Distance/LOS_Distance;
%% Display Results
fprintf('\nSKIP DISTANCE AND TROPOSPHERIC PROPAGATION ANALYSIS\n');
fprintf('---------------------------------------------------\n');
fprintf('Ionospheric Height = %.2f km\n',h);
fprintf('Skip Distance at 60° = %.2f km\n',...
    2*h*tand(60));
fprintf('LOS Distance = %.2f km\n',LOS_Distance);
fprintf('Coverage Ratio = %.2f\n',...
    (2*h*tand(60))/LOS_Distance);
%% Plot Results
figure('Name',...
    'Skip Distance and Tropospheric Propagation',...
    'NumberTitle','off');
subplot(2,2,1)
plot(theta,Skip_Distance,'LineWidth',2)
grid on
xlabel('Angle of Incidence (Degree)')
ylabel('Skip Distance (km)')
title('Skip Distance vs Angle')
subplot(2,2,2)
bar(LOS_Distance)
grid on
title('Tropospheric LOS Distance')
ylabel('Distance (km)')
set(gca,'XTickLabel',{'LOS Range'})
subplot(2,2,3)
plot(theta,Coverage_Ratio,'LineWidth',2)
grid on
xlabel('Angle of Incidence (Degree)')
ylabel('Coverage Ratio')
title('Coverage Ratio Analysis')
subplot(2,2,4)
plot(theta,Skip_Distance,'r','LineWidth',2)
hold on
yline(LOS_Distance,'b--','LineWidth',2)
grid on
legend('Skip Distance','LOS Distance')
xlabel('Angle of Incidence (Degree)')
ylabel('Distance (km)')
title('Comparison of Sky Wave and Tropospheric Propagation')