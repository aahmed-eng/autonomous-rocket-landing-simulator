function newstate = simulator(thrust, state)
%SIMULATOR recalculates state structure
% Inputs: a variable containing thrust in N, the current state structure
% Outputs: a structure containing the next state

% Make a new copy of all the current variables in state
newstate = state;
 
%       2.3.1 Calculate the acceleration.
% 
%           2.3.1.1 If fuelmass>0, calculate the fuel mass, making sure it
%             can't be negative.
if newstate.fuelmass > 0
    newstate.fuelmass = max(state.fuelmass - state.br*abs(thrust)*state.dt, 0);
end

%           2.3.1.2 Calculate the total mass.
newstate.m = newstate.fixedmass + newstate.fuelmass;

%           2.3.1.3 Decide whether or not to ignore thrust by checking if
%               there is fuel left.
%                 if fuelmass<=0: thrust=0
if newstate.fuelmass <= 0
    thrust = 0;
end

%           2.3.1.4 Calculate drag force.
%             D = state.d*state.v*abs(state.v)
D = state.d*state.v*abs(state.v);

%           2.3.1.4 Calculate the force.
F = thrust - D - state.m*state.g;

%           2.3.1.5 Use Newton's second law to calculate the acceleration.
newstate.a = F/state.m;

%       2.3.2 Use Euler's method to find the position at the next step.
newstate.h = state.h + state.dt * state.v;

%       2.3.3 Use Euler's method to find the velocity at the next step.
newstate.v = state.v + state.dt * state.a;

%       2.3.4 Increase the time by dt.
newstate.t = state.t + state.dt;

end

