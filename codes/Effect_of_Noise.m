% PROJECT: Effect of Noise on Numerical Derivative.
clc; clear; close all;

dt = 0.01;
t = 0:dt:5;

% Clean signal and derivative.
x_clean = sin(2*pi*1*t);
x_dot_clean = 2*pi*1*cos(2*pi*1*t);

% Add Gaussian noise to signal.
noise = 0.2 * randn(size(t));
x_noisy = x_clean + noise;

% Numerical derivative of noisy signal.
x_dot_noisy = zeros(size(x_noisy));
x_dot_noisy(2:end-1) = (x_noisy(3:end) - x_noisy(1:end-2)) / (2*dt);
x_dot_noisy(1) = (x_noisy(2) - x_noisy(1)) / dt;
x_dot_noisy(end) = (x_noisy(end) - x_noisy(end-1)) / dt;

% Plot comparison.
figure;
plot(t, x_dot_clean, 'k', 'LineWidth', 2); hold on;
plot(t, x_dot_noisy, 'r--');
legend('True Derivative', 'Numerical Derivative (Noisy)');
title('Effect of Noise on Numerical Derivative');
xlabel('Time [s]'); ylabel('dx/dt');
grid on;
