function [thrust, vT] = ThrustControl(state)
%THRUSTCONTROL calculates the target velcity and thrust produced by the
% rocket.
% Output: Thrust is the value of thrust force which the rocket produces in
% N, vT is the target velocity in m/s.


% 2.2.1 Get a target velocity for current time step from Descent Planner.
vT = velocityPlanner(state);
% 2.2.2 Find the thrust, based on this target velocity.
%     thrust = gain*err + state.m*state.g
err = state.vT - state.v;
thrust = state.k*err + state.m*state.g;

end

