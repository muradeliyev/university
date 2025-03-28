clc;
close all;

syms k1 k2

a0 = 1;
a1 = k1 + 0.5*k2 - 2;
a2 = 1 + 0.5*k2 - k1;

cond1 = abs(a2) < a0;
cond2 = 1 - a1 + a2 > 0;
cond3 = 1 + a1 + a2 > 0;

[k1_vals, k2_vals] = meshgrid(-2:0.05:4, -2:0.05:6);
cond1_vals = abs(1 + 0.5*k2_vals - k1_vals) < 1;
cond2_vals = 1 - (k1_vals + 0.5*k2_vals - 2) + (1 + 0.5*k2_vals - k1_vals) > 0;
cond3_vals = 1 + (k1_vals + 0.5*k2_vals - 2) + (1 + 0.5*k2_vals - k1_vals) > 0;

stable_region = cond1_vals & cond2_vals & cond3_vals;

figure
contourf(k1_vals, k2_vals, stable_region, [1 1], 'LineColor', 'b')
xlabel('k_1')
ylabel('k_2')
title('Stable Region for k_1 and k_2 (Jury Test)')
grid on;
