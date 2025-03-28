clc;
close all;

% Define numerator and denominator of the closed-loop transfer function from Task 1
num = conv([0.0234 0.022], 1);
den = polyadd([1 -1.8187 0.8187], conv([0.0234 0.022], 1));

% Plot impulse response
dimpulse(num, den);
title('Impulse Response of the Closed-Loop System');
xlabel('Time (samples)');
ylabel('Amplitude');
grid on;
