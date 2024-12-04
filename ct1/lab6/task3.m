clc;
close all;


% a)
syms k1

coeffs = [1, 55, 250, 0.5 * k1];

routhArray = routh(coeffs);

disp('Routh Array:');
disp(routhArray);

T1_values = linspace(0.01, 1, 100); % Range for T1
k1_max_values = zeros(size(T1_values));

for i = 1:length(T1_values)
    T1 = T1_values(i);
    coeffs = [T1 * 0.2, (T1 + 0.2), 1, 0.002 * k1];
    routhArray = routh(coeffs);
end

figure;
plot(T1_values, k1_max_values, 'b-', 'LineWidth', 2);
xlabel('T1 (s)');
ylabel('Maximum k1 for Stability');
title('Stability Region for k1 and T1');
grid on;
