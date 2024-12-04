clc;
close all;

global T1 k2 c0 c1 c2;

k1 = 1;
T1 = 75;
k2 = 1.2;
c0 = 85000;
c1 = 5700;
c2 = 150;

% --------------------- a --------------------
% Controller: k1*(T1*s + 1) / (T1*s)
Gc = tf([k1*T1, k1], [T1, 0]);

% Plant: k2 / (c0*s^3 + c1*s^2 + c2*s + 1)
Gp = tf(k2, [c0, c1, c2, 1]);

% Open-loop system (controller * plant)
G_open = series(Gc, Gp);

% Create the feedback system with unity feedback
% H(s) = 1
sys = feedback(G_open, 1);

% Simulate the step response for the reference input R(s) = 1/s
t = 0:0.1:1000; % Time vector
r = ones(size(t)); % Unit step input for R(s)

% Disturbance transfer function
disturbance = tf(1, [1 0]);

% Response to the reference input
[y_ref, t_ref] = step(sys, t);

% Response to the disturbance input
[y_dist, t_dist] = lsim(sys, ones(size(t)), t);

% Total response (reference input + disturbance input)
y_total = y_ref + y_dist;

% Plot the responses
figure;
plot(t, y_ref, 'b', 'LineWidth', 2); hold on;
plot(t, y_dist, 'r--', 'LineWidth', 2);
plot(t, y_total, 'k', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Response y(t)');
legend('Response to R(s)', 'Response to D(s)', 'Total Response');
title('System Response to Step Input and Disturbance');
grid on;

% --------------------- b --------------------
function showPlot(k1)   
    global T1 k2 c0 c1 c2;

    % Controller: k1*(T1*s + 1) / (T1*s)
    Gc = tf([k1*T1, k1], [T1, 0]);
    
    % Plant: k2 / (c0*s^3 + c1*s^2 + c2*s + 1)
    Gp = tf(k2, [c0, c1, c2, 1]);
    
    % Open-loop system (controller * plant)
    G_open = series(Gc, Gp);
    
    % Create the feedback system with unity feedback
    % H(s) = 1
    sys = feedback(G_open, 1);
    
    % Simulate the step response for the reference input R(s) = 1/s
    t = 0:0.1:1000; % Time vector
    r = ones(size(t)); % Unit step input for R(s)
    
    % Disturbance transfer function
    disturbance = tf(1, [1 0]);
    
    % Response to the reference input
    [y_ref, t_ref] = step(sys, t);
    
    % Response to the disturbance input
    [y_dist, t_dist] = lsim(sys, ones(size(t)), t);
    
    % Total response (reference input + disturbance input)
    y_total = y_ref + y_dist;
    
    % Plot the responses
    figure;
    plot(t, y_ref, 'b', 'LineWidth', 2); hold on;
    plot(t, y_dist, 'r--', 'LineWidth', 2);
    plot(t, y_total, 'k', 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Response y(t)');
    legend('Response to R(s)', 'Response to D(s)', 'Total Response');
    grid on;
end


showPlot(0.2);
showPlot(0.2);
