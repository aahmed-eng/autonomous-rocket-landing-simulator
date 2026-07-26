% A script to simulate a rocket landing. 
% Simulation uses Euler's Method to predict next steps. 
% Lander starts at 3000 metres high, and hopes to land gently by use of a
% controller.
% Build 8: Automate Investigation of Piecewise Linear Velocity Models
% Ameen Ahmed

% 0. Clear workspace etc for new run
clear variables
clc
close all

% Set initial parameters
state.Hpoints = [0 1500 3000];
ystart = 50; yend = 300; dy = 25;

% Initialise vectors
y = ystart:dy:yend;
x = length(y);
LV = NaN(1,x); % landing velcocity
FL = NaN(1,x); % fuel left
MA = NaN(1,x); % max acceleration
VT_1500 = NaN(1,x); % target velocity at 1500m

% For loop to change value of target velocity at height of 1500m
hold on
for l = 1:x
    state.Vpoints = [-1 -y(l) -300];
    lineCoeffs = findLines(state.Hpoints, state.Vpoints);

    [LV(l), FL(l), MA(l)] = LanderFunc(lineCoeffs);
    VT_1500(l) = -y(l);

    plot(0:3000, getPWL(lineCoeffs, 0:3000), 'b')
end
hold off
ylabel('Target Velocity (ms^{-1})')
xlabel('Height (m)')
sgtitle('Flight Plans')



figure % create new figure
sgtitle('Build 8: Automate Investigation of Piecewise Linear Velocity Models')
% Plot landing velocity
subplot(3, 1, 1)
hold on
plot(VT_1500, LV, 'g--')
plot([-ystart -yend], [-2 -2], 'b--')
hold off
ylabel('Landing Velocity (ms^{-1})')
grid on

% Plot landing velocity
subplot(3, 1, 2)
hold on
plot(VT_1500, FL, 'g--')
plot([-ystart -yend], [0 0], 'b--')
hold off
ylabel('Fuel Left (kg)')
grid on

% Plot maximum acceleration
subplot(3, 1, 3)
hold on
plot(VT_1500, MA, 'g--')
plot([-ystart -yend], [6*9.81 6*9.81], 'b--')
hold off
ylabel('Maximum Acceleration (ms^{-2})')
grid on
xlabel('Target Velocity (ms^{-1}) at Height of 1500m')

