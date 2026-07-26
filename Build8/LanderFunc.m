function [vLand,FuelLeft,maxAcc] = LanderFunc(lineCoeffs)
%LANDERFUNC Summary of this function goes here
%   Detailed explanation goes here

% 1. Initialise the values.
% 
%    1.1 Set the Model Parameters.
state.fixedmass = 500; % kg Rocket Mass with no fuel
state.fuelmass = 1500; % kg
state.m = state.fixedmass + state.fuelmass; % kg
state.br = 0.001; % Fuel Burn Rate in kg N^-1 s^-1
state.g = 9.81; % Acceleration due to gravity m s^-2
state.d = 1/3; % Drag Constant in N s^2 m^-2
state.k = 1000; % Feedback gain for thrust control
state.a = -state.g; % Acceleration m s^-2
state.v = -300; % Velocity m s^-1
state.vT = state.v; % Target velocity in m s^-1
state.h = 3000; % Height m
state.t = 0; % Time s
state.dt = 0.1; % Step size s

%    1.2 Initialise vectors to store the data to plot.
tstart=0; tend=10000;
T = tstart:state.dt:tend;
n = length(T);

A = NaN(1,n);
V = NaN(1,n);
H = NaN(1,n);
FM = NaN(1,n);
VT = NaN(1,n);
k = 1;

% 2. Repeat for each time step while the lander is above the ground.
while (state.h>0 && k<n)
%    2.1 Store the data to plot later.
    VT(k) = state.vT;
    A(k) = state.a;
    V(k) = state.v;
    H(k) = state.h;
    FM(k) = state.fuelmass;
%    2.2 Calculate the target velocity
    state.vT = getPWL(lineCoeffs, state.h);
%    2.3 Get the thrust from the controller.
    thrust = ThrustControl(state);
%    2.4 Run the simulator to predict what will happen over the next time step.
    state = simulator(thrust, state);
    k = k+1;

end

A = A(1:k-1);
V = V(1:k-1);
% H = H(1:k-1);
FM = FM(1:k-1);
% VT = VT(1:k-1);
% T = T(1:k-1);

vLand = V(end);
FuelLeft = FM(end);
maxAcc = max(abs(A));


end

