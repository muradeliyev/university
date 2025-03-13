clc; clear; close all;

% Task 1 & 2
A = [1 -1.5 0.7];
B = [0 1 0.5];
C = [1 -1 0.2];
Ts = 0.25;

model = idpoly(A, B, C, 'Ts', Ts);

rng(113);
rbs = idinput(350, 'rbs');

% Task 3
sys = sim(model, rbs, simOptions('AddNoise', true));

% Task 4
data = iddata(sys, rbs, Ts);

% Task 5
% figure;
% plot(data(1:100)); grid on;

% Task 6
est_data = data(1:200);
val_data = data(201:end);

% Task 7 - 8
% figure;
% h = spa(est_data);
% bode_est_data = bodeplot(h); grid on;

% Task 9
% showConfidence(bode_est_data, 3);

% Taks 10
ss_model = ssest(est_data);

%disp('Estimated State-Space Model:');
ss_model;
order(ss_model);

% Task 11
est_data_tfest = tfest(est_data, 2, 2);

% Task 12
est_arx = arx(est_data, [2 2 1]);

% Task 13
% figure;
% compare(val_data, ss_model, est_data_tfest, est_arx); grid on;
% title('Model Comparison: State-space, Transfer Function, ARX');

% Task 14 (Discrete)
est_data_tfest_dc = tfest(est_data, 2, 2, 'Ts', Ts);
est_oe = oe(est_data, [2 2 1]);

% Task 15
figure;
compare(val_data, est_data_tfest_dc, est_oe); grid on;
title('Model Comparison: Discrete Transfer Function, Discrte Output-Error');

% Task 16
figure;
subplot(2, 2, 1);
resid(val_data, ss_model); grid on;
title('SS model');

subplot(2, 2, 2);
resid(val_data, est_data_tfest); grid on;
title('TF model');

subplot(2, 2, 3);
resid(val_data, est_oe); grid on;
title('OE model');

subplot(2, 2, 4);
resid(val_data, est_arx); grid on;
title('ARX model');

% Question 1
p = roots([1 -2.3 1.7 -0.4]);
