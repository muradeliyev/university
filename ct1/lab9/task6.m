clc;
close all;


k1 = 8/100;
k2 = 0.5/100;
T1 = 20;
T2 = 25;
c0 = 4200;
c1 = 180;

% Transfer function
G = tf([k1*k2], [T1*T2*c0, T1*T2*c1+T1*c0+T2*c1, T1*c1+T2*c1+c0, c1, 1]);

% Nyquist plot
nyquist(G);
