clc;
close all;


K = 20;

% Define the open-loop transfer function L(s) = K / ((s+1)(s+3)(s+6))
denominator_L = conv(conv([1 1], [1 3]), [1 6]);

characteristic_poly = denominator_L;
characteristic_poly(end) = characteristic_poly(end) + K;

% Find the roots of the characteristic polynomial
closed_loop_roots = roots(characteristic_poly);

% Check stability by examining the real parts of the roots
if all(real(closed_loop_roots) < 0)
    disp('The closed-loop system is stable (all roots have negative real parts).');
else
    disp('The closed-loop system is unstable (one or more roots have positive real parts).');
end
