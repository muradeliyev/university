clc; 
close all;

T0 = 0.2;
num = [0.12 0.05];
den = [1 -1.8187 0.8187];

Gz = tf(num, den, T0);

bode(Gz);
margin(Gz);
