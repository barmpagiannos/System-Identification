% PROJECT: Parameter estimation of a discrete-time ARX model using Least Squares.
% We simulate a system with known parameters and try to estimate them from noisy data.
% The model structure is:
%   x(t) = -a1*x(t-1) - a2*x(t-2) + b1*u(t-1) + b2*u(t-2)

clc, clear, close all;

% TRUE PARAMETERS OF THE SYSTEM (to be estimated).
a1_true = 1.5;
a2_true = -0.7;
b1_true = 0.5;
b2_true = 0.1;

N = 500;                 % Number of samples.
u = randn(N,1);          % Input signal: white noise.
x = zeros(N,1);          % Output signal (to be generated).

% GENERATE OUTPUT DATA FROM THE KNOWN ARX MODEL.
for t = 3:N
    x(t) = -a1_true*x(t-1) - a2_true*x(t-2) + b1_true*u(t-1) + b2_true*u(t-2);
end

% ADD MEASUREMENT NOISE TO THE OUTPUT.
x_noisy = x + 0.05*randn(N,1);

% BUILD REGRESSOR MATRIX PHI AND OUTPUT VECTOR Y.
Phi = zeros(N-2, 4);
Y = zeros(N-2, 1);
for t = 3:N
    Phi(t-2,:) = [-x_noisy(t-1), -x_noisy(t-2), u(t-1), u(t-2)];
    Y(t-2) = x_noisy(t);
end

% PARAMETER ESTIMATION USING LEAST SQUARES.
theta_hat = (Phi' * Phi) \ (Phi' * Y);   % Solve (Phi^T * Phi)^(-1) * Phi^T * Y.

a1_hat = theta_hat(1);
a2_hat = theta_hat(2);
b1_hat = theta_hat(3);
b2_hat = theta_hat(4);

% DISPLAY RESULTS.
fprintf("True parameters:\n");
fprintf("a1 = %.3f, a2 = %.3f, b1 = %.3f, b2 = %.3f\n", a1_true, a2_true, b1_true, b2_true);

fprintf("\nEstimated parameters:\n");
fprintf("a1 = %.3f, a2 = %.3f, b1 = %.3f, b2 = %.3f\n", a1_hat, a2_hat, b1_hat, b2_hat);
