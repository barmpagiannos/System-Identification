% PROJECT: Online parameter estimation of a harmonic oscillator using Recursive Least Squares (RLS).
% We estimate omega^2 in real-time from acceleration and position measurements: a(t) = -omega^2 * x(t).

clc, clear, close all;

% TRUE SYSTEM PARAMETERS (for comparison).
m_true = 1.0;    % Mass in kg.
k_true = 4.0;    % Spring constant in N/m.
omega_true = sqrt(k_true / m_true);  % Natural frequency.

% SIGNAL GENERATION.
dt = 0.01;
t = 0:dt:10;                          % Time vector.
x = cos(omega_true * t);             % Position x(t).
v = -omega_true * sin(omega_true * t);       % Velocity ẋ(t).
a = -omega_true^2 * cos(omega_true * t);     % Acceleration ẍ(t).

% The model used is: a(t) = -omega^2 * x(t).
% Or: y(t) = phi(t)' * theta, with phi(t) = -x(t), theta = omega^2.

% INITIALIZE RLS ESTIMATOR.
theta_hat = 1.0;        % Initial estimate of omega^2.
P = 1000;               % Initial covariance (large uncertainty).
lambda = 0.99;          % Forgetting factor (close to 1 for slow adaptation).

theta_history = zeros(length(t), 1);        % Store theta estimates.
omega_hat_history = zeros(length(t), 1);    % Store omega estimates.

% ONLINE RECURSIVE ESTIMATION.
for i = 1:length(t)
    phi = -x(i);          % Regressor.
    y = a(i);             % Output (acceleration).
    
    % Kalman gain.
    K = (P * phi) / (lambda + phi * P * phi);
    
    % Parameter update.
    e = y - phi * theta_hat;            % Estimation error.
    theta_hat = theta_hat + K * e;      % Update theta.
    
    % Covariance update.
    P = (P - K * phi * P) / lambda;
    
    % Save history.
    theta_history(i) = theta_hat;
    omega_hat_history(i) = sqrt(abs(theta_hat));  % Estimated omega.
end

% PLOTTING RESULTS.
figure;

subplot(2,1,1);
plot(t, theta_history, 'b', 'LineWidth', 2); hold on;
yline(omega_true^2, 'r--', 'LineWidth', 1.5);
ylabel('\theta = \omega^2');
title('Online estimation of \omega^2 using RLS');
legend('Estimated', 'True');
grid on;

subplot(2,1,2);
plot(t, omega_hat_history, 'm', 'LineWidth', 2); hold on;
yline(omega_true, 'k--', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('\omega [rad/s]');
title('Online estimation of natural frequency \omega');
legend('Estimated', 'True');
grid on;
