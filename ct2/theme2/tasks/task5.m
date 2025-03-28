clc;

num = [0.632 0];
den = [1 -0.736 0.368];
x = [1 zeros(1,20)];
y = filter(num, den, x);
k = 0:20;
plot(k, y, 'o');
v = [0 20 -0.2 0.8];
axis(v), grid;
title('Response to Kronecker Delta Input')
xlabel('k');
ylabel('y(k)');
