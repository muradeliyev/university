clc;
close all;

syms k

a1 = -1.368 + 0.432*k;
a0 = 0.368;

cond1 = a1 > 0;
cond2 = a0 > 0;

sol_k = solve(cond1, k);

disp('Stability condition:');
disp(['k > ' char(vpa(sol_k))]);
