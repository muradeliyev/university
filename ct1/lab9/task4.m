clc;
close all;

numerator = 10 * [0.4, 1];
denominator = conv([1, 0], conv([1, -1], conv([0.02, 1], [0.002, 0.09, 1])));
L = tf(numerator, denominator);

figure;
nyquist(L);
title('Nyquist Plot of L(s)');

T = feedback(L, 1);

figure;
step(T);
title('Step Response of the Closed-Loop System');
