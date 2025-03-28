clc;
close all;

coeffs = [1 -0.67 0.17];
roots_T = roots(coeffs);
if all(abs(roots_T) < 1)
    disp('The system is stable');
else
    disp('The system is unstable');
end

figure;
zplane(roots_T);
title('Closed-loop Poles of Task 2');
