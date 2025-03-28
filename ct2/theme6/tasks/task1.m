clc;
close all;

% System a
coeffs_a = [5 2 3 1];
roots_a = roots(coeffs_a);
if all(abs(roots_a) < 1)
    disp('System a is stable');
else
    disp('System a is unstable');
end
figure
zplane(roots_a)
title('System a')

% System b
coeffs_b = [1 2 1.25 0.5];
roots_b = roots(coeffs_b);
if all(abs(roots_b) < 1)
    disp('System b is stable');
else
    disp('System b is unstable');
end
figure
zplane(roots_b)
title('System b')

% System c
coeffs_c = [1 0.5 0.25 0.2 0];
roots_c = roots(coeffs_c);
if all(abs(roots_c) < 1)
    disp('System c is stable');
else
    disp('System c is unstable');
end
figure
zplane(roots_c)
title('System c')

% System d
coeffs_d = [1 1 1];
roots_d = roots(coeffs_d);
if all(abs(roots_d) < 1)
    disp('System d is stable');
else
    disp('System d is unstable');
end
figure
zplane(roots_d)
title('System d')