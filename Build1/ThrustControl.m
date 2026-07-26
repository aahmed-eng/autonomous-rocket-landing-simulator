function Thrust = ThrustControl(state)
%THRUSTCONTROL calculates the thrust produced by the rocket.
% Input: state is a structure containing information about the rocket's
% body mass and fuel mass.
% Output: Thrust is the value of thrust force which the rocket produces in N.

% 2.2.1 Calculate current weight
weight = (state.fixedmass+state.fuelmass)*state.g;

% 2.2.2 Set thrust based on weight
Thrust = 0.5*weight;

end

