clc;
close all;

% Define the continuous-time plant G(s)
s = tf('s');
G_cont = 16 / (s * (0.1*s + 1));

% Sampling times to test
T0_list = [0.01, 0.005];

for i = 1:length(T0_list)
    T0 = T0_list(i);

    Gz = c2d(G_cont, T0, 'zoh');

    % Plot Bode plot with stability margins
    figure;
    margin(Gz);
    title(['Bode Plot with Stability Margins for T_0 = ', num2str(T0), ' sec']);
    grid on;
end
