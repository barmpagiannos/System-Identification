% PROJECT: Demonstration of measurement noise and filtering (noise cancellation).
% This script shows how noise affects a signal and how low-pass filters
% (moving average and Butterworth) can reduce the noise.

clc; clear; close all;

% 1. SYNTHETIC NOISY SIGNAL.
y_clean = sin(0.1 * (1:100));         % Clean reference signal.
noise = 0.1 * randn(1, 100);          % Additive random noise (Gaussian).
y_noisy = y_clean + noise;           % Measured signal with noise.

% Plot the signals and noise.
plot(1:100, y_clean, 'b', 1:100, y_noisy, 'r--', 1:100, noise, 'Color', [0.5 0.5 0.5]);
grid on;
hold on;
yline(mean(noise), 'k--');            % Mean value of the noise.

legend('Clean', 'Noisy', 'Noise', 'Mean noise value');
title('Example of Measurement Noise');

% Print mean value of noise.
fprintf("Mean value of noise: %.4f.\n", mean(noise));

% 2. FILTERING THE NOISY SIGNAL.

% Apply MATLAB's built-in lowpass filter.
filteredSignal = lowpass(y_noisy, 0.1);   % Low-pass with cutoff 0.1 (normalized).
plot(1:100, filteredSignal, 'g--');

% Apply moving average filter with window size 10.
y_filtered = movmean(y_noisy, 10);
plot(1:100, y_filtered, 'k--');

legend('Clean', 'Noisy', 'Noise', 'Mean noise value', 'Lowpass', 'Moving Average');

% 3. COMPARISON WITH BUTTERWORTH FILTER (more realistic time-based example).

figure;

t = 0:0.01:10;
y_clean = sin(2*pi*0.5*t);               % Clean signal: sine wave 0.5 Hz.
y_noisy = y_clean + 0.3 * randn(size(t));  % Add noise

% Design 2nd-order Butterworth low-pass filter (cutoff = 0.1 normalized).
[b, a] = butter(2, 0.1);

% Apply zero-phase digital filtering (no phase distortion).
y_filt = filtfilt(b, a, y_noisy);

% Plot.
plot(t, y_clean, 'k', t, y_noisy, 'r--', t, y_filt, 'b');
legend('Clean', 'Noisy', 'Butterworth Filtered');
title('Noise Cancelling with Butterworth Filter');
xlabel('Time [s]');
ylabel('Signal Amplitude');
grid on;
