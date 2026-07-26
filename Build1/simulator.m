function newstate = simulator(thrust, state)
%SIMULATOR recalculates state structure
% Inputs: a variable containing thrust in N, the current state structure
% Outputs: a structure containing the next state

% Make a new copy of all the current variables in state
newstate = state;
 
%       2.3.1 Calculate the acceleration.
% 
%           2.3.1.1 Calculate the total mass.
m = state.fixedmass+state.fuelmass;
%           2.3.1.2 Calculate the force.
F = thrust-m*state.g;
%           2.3.1.3 Use Newton's second law to calculate the acceleration.
newstate.a = F/m;
%       2.3.2 Use Euler's method to find the position at the next step.
newstate.h = state.h + state.dt * state.v;
%       2.3.3 Use Euler's method to find the velocity at the next step.
newstate.v = state.v + state.dt * state.a;
%       2.3.4 Increase the time by dt.
newstate.t = state.t + state.dt;

end

