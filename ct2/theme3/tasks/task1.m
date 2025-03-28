clc;
close all;

T0 = 0.2;

num = [0.0234 0.022];
den = [1 -1.8187 0.8187];

Gz = tf(num, den, T0);

Tz = feedback(Gz, 1);

step(Tz);
grid on;
title('Step Response of the Closed-Loop System');
xlabel('Time (seconds)');
ylabel('Amplitude');
