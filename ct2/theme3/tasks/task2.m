clc;
close all;

k = 16;
T1 = 0.1;
T2 = 0.46;
T3 = 0.58;

s = tf('s');
Gs = k * (T3*s + 1) / ((T1*s + 1)*(T2*s + 1));

T0_list = [0.007, 0.01, 0.002];
colors = ['r', 'g', 'b'];

figure;
hold on;

for i = 1:length(T0_list)
    T0 = T0_list(i);

    Gz = c2d(Gs, T0, 'zoh');

    Tz = feedback(Gz, 1);

    step(Tz, 5, colors(i));
end

legend('T_0 = 0.007 s', 'T_0 = 0.01 s', 'T_0 = 0.002 s');
title('Step Responses for Different Sampling Periods');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
