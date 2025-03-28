clc;
close all;


% a)
syms omega k1
k2 = 2;
T = 0.01;
c0 = 0.0004;
c1 = 0.008;

% Denominator magnitude
denominator = omega * sqrt((T*omega)^2 + 1) * sqrt((c0*omega^2 - 1)^2 + (c1*omega)^2);
k1 = solve((2 * k1) / denominator == 1, k1);

disp('Critical gain k1:');
disp(k1);

% b)
k2 = 2;
T = 0.01;
c0 = 0.0004;
c1 = 0.008;

magnitude = @(omega) omega .* sqrt((T * omega).^2 + 1) .* ...
    sqrt((c0 * omega.^2 - 1).^2 + (c1 * omega).^2);

critical_frequency_eq = @(omega) magnitude(omega) - 2;
omega_c = fzero(critical_frequency_eq, 1);

k1_critical = magnitude(omega_c) / 2;

fprintf('Critical frequency (omega_c): %.4f rad/s\n', omega_c);
fprintf('Critical gain (k1): %.4f\n', k1_critical);
