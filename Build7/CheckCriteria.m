function [vLand,FuelLeft,maxAcc] = CheckCriteria(A,V,FM)
% Given row vectors of results for acceleration, velocity, height, time and fuelmass,
% return a message that states if each criteria is passed. Also output key values:
% velocity at landing, fuelmass at landing, max acceleration.

vLand = V(end);
FuelLeft = FM(end);
maxAcc = max(abs(A));

% Criteria #1: Touchdown Velocity between 0 and -2 m/s
if (vLand <= 0 && vLand >= -2)
    disp("Landing Velocity = " + vLand + "m/s. pass!")
else
    disp("Landing Velocity = " + vLand + "m/s. fail!")
end

% Criteria #2: Fuel Mass upon Landing is Greater than zero
if FuelLeft > 0
    disp("Fuel remaining at the end = " + FuelLeft + "kg. pass!")
else
    disp("Fuel remaining at the end = " + FuelLeft + "kg. fail!")
end

% Criteria #3: Acceleration always between -6g and 6g
if max(abs(A))<=6*9.81
    disp("Max. Acceleration = " + max(abs(A)) + "m/s^2. pass!")
elseif max(abs(A)) > 6*9.81
    disp("Max. Acceleration = " + max(abs(A)) + "m/s^2. fail!")
end


end