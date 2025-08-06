% PROJECT: Online estimation of mass (m) and spring constant (k).
% using Recursive Least Squares (RLS) from measured data.
% The system is modeled as: u(t) = m * ẍ(t) + k * x(t).

clc, clear, close all;

% Measured data (4 samples).
x = [0.1 0.05 0.02 0.01];         % Position x(t).
xddot = [-2.0 -1.0 -0.5 -0.2];    % Acceleration ẍ(t).
u = [1.5 0.8 0.4 0.2];            % Input force u(t).

N = length(u);   % Number of samples.

% RLS initialization.
theta_hat = [0; 0];              % Initial estimate for [m; k].
P = 1000 * eye(2);               % Initial information matrix (large = high uncertainty).

% RLS loop
for t = 1:N
    phi = [xddot(t); x(t)];      % Regressor vector: [ẍ; x].
    
    % Compute Kalman gain K(t).
    K = (P * phi) / (1 + phi' * P * phi);
    
    % Compute prediction error.
    error = u(t) - phi' * theta_hat;
    
    % Update parameter estimate.
    theta_hat = theta_hat + K * error;
    
    % Update information matrix.
    P = P - K * phi' * P;
    
    % Display results at each step.
    fprintf('Step %d: m = %.4f, k = %.4f\n', t, theta_hat(1), theta_hat(2));
end
