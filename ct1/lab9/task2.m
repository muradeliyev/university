clc;
close all;


% Define the plant transfer function
num = [1]; % Numerator coefficients of the plant
den = [1, 2, 1]; % Denominator coefficients of the plant
plant = tf(num, den);

% Design a PD Controller (adjust gains as needed)
Kp = 10; % Proportional gain
Kd = 2;  % Derivative gain
controller = tf([Kd, Kp], 1); % PD Controller

% Closed-loop system
sys_cl = feedback(controller * plant, 1);

while (TRUE)
end

% Step response
figure;
step(sys_cl);
grid on;
title('Step Response of the Closed-Loop System');

% Performance metrics
info = stepinfo(sys_cl);
settling_time = info.SettlingTime;
overshoot = info.Overshoot;

% Display metrics
fprintf('Settling Time: %.2f seconds\n', settling_time);
fprintf('Percent Overshoot: %.2f%%\n', overshoot);

% Redesign the controller if specifications are not met
if settling_time > 2 || overshoot > 10
    disp('Redesigning the controller...');
    Kp = 20; % Adjusted proportional gain
    Kd = 5;  % Adjusted derivative gain
    controller = tf([Kd, Kp], 1);
    sys_cl = feedback(controller * plant, 1);

    % Plot new response
    figure;
    step(sys_cl);
    grid on;
    title('Redesigned Step Response');

    % Recalculate metrics
    info = stepinfo(sys_cl);
    settling_time = info.SettlingTime;
    overshoot = info.Overshoot;

    fprintf('New Settling Time: %.2f seconds\n', settling_time);
    fprintf('New Percent Overshoot: %.2f%%\n', overshoot);
end
