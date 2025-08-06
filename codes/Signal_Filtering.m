% PROJECT: Signal Filtering (Noise Reduction).
clc; clear; close all;

dt = 0.01;
t = 0:dt:5;

% Generate noisy signal.
y_clean = sin(2*pi*0.5*t);             % Clean 0.5 Hz sine signal.
y_noisy = y_clean + 0.3 * randn(size(t));  % Add Gaussian noise.

% Moving average filter (window size 20).
y_movmean = movmean(y_noisy, 20);

% Butterworth low-pass filter.
y_normalized_cutoff = 0.1;             % Normalized cutoff frequency.
[b, a] = butter(2, y_normalized_cutoff);  % 2nd-order filter.
y_butter = filtfilt(b, a, y_noisy);    % Zero-phase filtering.

% Savitzky-Golay filter.
y_sgolay = sgolayfilt(y_noisy, 3, 21); % Polynomial order 3, window size 21.

% Plot all signals.
figure;
plot(t, y_clean, 'k', 'LineWidth', 2); hold on;
plot(t, y_noisy, 'r--');
plot(t, y_movmean, 'b');
plot(t, y_butter, 'g');
plot(t, y_sgolay, 'm');
legend('Clean', 'Noisy', 'Moving Avg', 'Butterworth', 'Savitzky-Golay');
title('Signal Filtering and Noise Reduction');
xlabel('Time [s]'); ylabel('Signal');
grid on;
