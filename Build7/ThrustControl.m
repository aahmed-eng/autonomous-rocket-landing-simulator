function thrust = ThrustControl(state)
%THRUSTCONTROL calculates the target velcity and thrust produced by the
% rocket.
% Output: Thrust is the value of thrust force which the rocket produces in
% N, vT is the target velocity in m/s.


% 2.3.1 Find the thrust, based on the target velocity.
%     thrust = gain*err + state.m*state.g
err = state.vT - state.v;
thrust = state.k*err + state.m*state.g;

end

