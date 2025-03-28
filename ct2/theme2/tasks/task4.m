clc;
clear;

num = [0.632 0];
den = [1 -0.736 0.368];

N = 4;
x_k = filter(num, den, [1 zeros(1, N-1)]);

disp('Computed values of x(k) for k = 0,1,2,3:');
disp(x_k);
