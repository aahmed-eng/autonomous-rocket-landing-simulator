function PlotGraphs(A, V, H, FM, VT, T)
%PLOTGRAPHS plots height, velocity, acceleration and mass against time,
%plots the minimum fuel mass, the minimum and maximum acceleration
%points and the velocity at landing and gives these values.
% Inputs: vectors of accelertion, velocity, height, fuel mass and time
% Four graphs are plotted vertically, all 4 have the same time (x-axis)

% Plot height
subplot(4, 1, 1)
plot(T, H, 'r')
ylabel('height (m)')
grid on


% Plot velocity
subplot(4, 1, 2)
hold on
plot(T, V, 'b', DisplayName="Lander Velocity")
plot(T, VT, 'k--', DisplayName="Target Velocity")
plot(T(end), V(end), 'r*', HandleVisibility='off') % plot landing velocity
hold off

% Add text to explain landing velocity point
text(T(end), V(end), "Landing Velocity = " + V(end) + "ms^{-1}")
ylabel('velocity (ms^{-1})')
grid on
legend


% Find min/max acceleration
[minA, minIdx] = min(A);
[maxA, maxIdx] = max(A);

% Plot acceleration
subplot(4, 1, 3)
hold on
plot(T, A, 'g')

% Plot min/max points
plot(T(minIdx), minA, 'r*')
plot(T(maxIdx), maxA, 'r*')

hold off

% Add text to explain min/max points
text(1.02*T(minIdx), 0.15*minA, "Minimum acceleration = " + minA + "ms^{-2}")
text(1.02*T(maxIdx), 0.85*maxA, "Maximum acceleration = " + maxA + "ms^{-2}")
ylabel('acceleration (ms^{-2})')
grid on


% Find min fuel mass
[minFM, minFMIdx] = min(FM);

% Plot fuel mass
subplot(4, 1, 4)
hold on
plot(T, FM, 'k')
plot(T(minFMIdx), minFM, 'r*') % plot minimum fuel mass point
hold off

% Add text to explain minimum fuel mass point
text(1.02*T(minFMIdx), minFM, "Remaining fuel mass = " + minFM + "kg")
ylabel('fuel mass (kg)')
xlabel('time (s)')
grid on

sgtitle('Build 7: Piecewise Linear (PWL) Target Velocity')

end

