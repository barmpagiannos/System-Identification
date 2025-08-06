% PROJECT: Estimation of omega^2 using Least Squares from measured position and acceleration.
% The goal is to estimate the natural frequency ω of a mass-spring system from synthetic measurements.

clc, clear, close all;

% TRUE SYSTEM PARAMETERS.
m_true = 1.0;                      % Mass in kg.
k_true = 4.0;                      % Spring constant in N/m.
omega_true = sqrt(k_true / m_true);  % Natural frequency ω = sqrt(k/m).

% SYNTHETIC MEASUREMENTS.
dt = 0.01;              % Sampling interval.
t = 0:dt:10;            % Time vector.

% Measured signals.
x = cos(omega_true * t);                          % Position x(t).
a = -omega_true^2 * cos(omega_true * t);          % Acceleration ẍ(t) = -ω²x(t).

% CONSTRUCT DATA MATRICES FOR LEAST SQUARES.
Phi = -x';       % Regressor matrix (N×1).
y = a';          % Output vector (acceleration, N×1).

% ESTIMATION OF θ = ω² USING LEAST SQUARES.
theta_hat = (Phi' * Phi) \ (Phi' * y);   % Solve (ΦᵗΦ)⁻¹ Φᵗy.

% Infer ω from the estimated ω².
omega_hat = sqrt(abs(theta_hat));       % Use abs() to avoid sqrt of negative due to numerical error.

% DISPLAY RESULTS.
fprintf('True ω:           %.4f\n', omega_true);
fprintf('Estimated ω̂:     %.4f\n', omega_hat);
