% PROJECT: Euler Integration of dx/dt = f(x).
clc; clear, close all;

dt = 0.01;
T = 5;
t = 0:dt:T;

% Define ODE: dx/dt = -2x (exponential decay).
x_exact = exp(-2*t);              % Exact solution for comparison.

% Euler integration.
x_euler = zeros(size(t));
x_euler(1) = 1;                   % Initial condition.

for k = 1:length(t)-1
    x_euler(k+1) = x_euler(k) - 2*dt*x_euler(k);   % Euler step.
end

% Plot.
figure;
plot(t, x_exact, 'k', 'LineWidth', 2); hold on;
plot(t, x_euler, 'r--');
legend('Exact', 'Euler Approximation');
title('Euler Integration: dx/dt = -2x');
xlabel('Time [s]'); ylabel('x(t)');
grid on;
