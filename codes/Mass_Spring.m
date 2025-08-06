% PROJECT: Simulation and parameter estimation of a mass-spring system using least squares.
% We simulate the equation m * ẍ + k * x = 0 and then estimate m and k
% from data (position, acceleration, input force) using linear regression.

clc; clear; close all;

% SYSTEM SIMULATION: Mass-spring model m * ẍ + k * x = 0.

% True parameters.
m = 1.0;     % Mass in kg.
k = 4.0;     % Spring constant in N/m.

% Initial conditions.
x0 = 1.0;            % Initial position.
v0 = 0.0;            % Initial velocity.
x_init = [x0; v0];   % Initial state vector [position; velocity].

% Simulation time span.
tspan = [0, 10];

% ODE function (second-order system as a first-order system).
% x(1) = position, x(2) = velocity.
odefun = @(t, x) [x(2); -k/m * x(1)];

% Solve the ODE using ode45.
[t, x] = ode45(odefun, tspan, x_init);

% Plot the simulated position over time.
figure;
plot(t, x(:,1), 'b', 'LineWidth', 2);
xlabel('Time [s]');
ylabel('Position x(t) [m]');
title('Mass - Spring System');
grid on;

%% PARAMETER ESTIMATION FROM DATA (position, acceleration, force)

% Simulated or measured data (position, acceleration, input force).
% These could be sampled values from sensors or generated data.
x = [0.1 0.05 0.02 0.01];        % Position x(t) in meters.
xddot = [-2.0 -1.0 -0.5 -0.2];   % Acceleration d²x/dt² in m/s².
u = [1.5 0.8 0.4 0.2];           % Input force u(t) in Newtons.

% Construct the regressor matrix Phi.
% From equation: u(t) = m * ẍ(t) + k * x(t) ⇒ u = [ẍ x] * [m; k].
Phi = [xddot.' x.'];             % Nx2 matrix.

% Output vector (input force).
U = u.';                         % Nx1 column vector.

% Least squares estimation of parameters.
theta_hat = (Phi' * Phi) \ (Phi' * U);   % Solve (Phiᵗ*Phi)^(-1) * Phiᵗ * U.

% Extract estimated parameters.
m_est = theta_hat(1);
k_est = theta_hat(2);

% Display results.
fprintf('Estimated mass m = %.4f\n', m_est);
fprintf('Estimated spring constant k = %.4f\n', k_est);
