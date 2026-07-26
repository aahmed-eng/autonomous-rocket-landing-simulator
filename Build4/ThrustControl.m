function thrust = ThrustControl(state)
%THRUSTCONTROL calculates the thrust produced by the rocket.
% Output: Thrust is the value of thrust force which the rocket produces in N.


% 2.2.1 Get a target velocity for current time step from Descent Planner.
% 
% 2.2.2 Find the thrust, based on this target velocity.
%     thrust = gain*err + state.m*state.g
err = state.vT - state.v;
thrust = state.k*err + state.m*state.g;

end

