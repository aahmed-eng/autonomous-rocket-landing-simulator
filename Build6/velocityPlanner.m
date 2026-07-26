function [vT] = velocityPlanner(state)
%VELOCITYPLANNER Summary of this function goes here
%   Detailed explanation goes here

% 2.2.1 Get a target velocity for current time step from Descent Planner.
vT = state.slope*state.h+state.intercept;

end

