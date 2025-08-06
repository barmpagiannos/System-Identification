% PROJECT: Numerical Differentiation of a Signal (x → x_dot).
clc; clear; close all;

% Time vector and signal.
dt = 0.01;                        % Sampling time.
T = 5;                            % Total duration.
t = 0:dt:T;                       % Time vector.
x = sin(2*pi*1*t);               % Signal: sine wave (1 Hz).

% Derivatives using numerical methods.
x_dot_forward = diff(x) / dt;    % Forward difference.
x_dot_forward(end+1) = x_dot_forward(end);  % Pad to match size.

x_dot_backward = [x(1), diff(x)] / dt;      % Backward difference.

x_dot_central = zeros(size(x));            % Central difference.
x_dot_central(2:end-1) = (x(3:end) - x(1:end-2)) / (2*dt);
x_dot_central(1) = x_dot_forward(1);
x_dot_central(end) = x_dot_backward(end);

% True derivative for comparison.
x_dot_true = 2*pi*1*cos(2*pi*1*t);

% Plot results.
figure;
plot(t, x_dot_true, 'k', 'LineWidth', 2); hold on;
plot(t, x_dot_forward, 'r--');
plot(t, x_dot_backward, 'b-.');
plot(t, x_dot_central, 'g');
legend('True Derivative', 'Forward', 'Backward', 'Central');
title('Numerical Differentiation');
xlabel('Time [s]'); ylabel('dx/dt');
grid on;
