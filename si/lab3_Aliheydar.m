clc; clear; close all;

% Step 1-2: Define Model Parameters
A = [1];
B = [0 0.6 -0.2];
C = [1];
D = [1];
F = [1 -0.5];

Ts = 1;  % Sampling time
Nv = 1;  % Noise variance

% Create an identification polynomial model using the defined parameters
model = idpoly(A, B, C, D, F, 'Ts', Ts, 'NoiseVariance', Nv);

% Step 3: Generate Input Signal
N = 1275;  
uk = idinput(N, 'prbs', [0 1/5], [-1 1]);  % Pseudo-random binary sequence as input

% Step 4-5: Simulate Model Response
n = sim(model, uk);  
model.NoiseVariance = var(n) / 10;  % Adjust noise variance

y_sim = sim(model, uk, simOptions('AddNoise', true));  % Simulate with noise added

% Step 6: Prepare Data for Identification
data = iddata(y_sim, uk, Ts);
data = detrend(data);  % Remove trend for better analysis

% Step 7: Visualize Data
figure;
plot(data(1:500)); grid on;  % Plot first 500 samples for inspection

% Step 8: Estimate Impulse Response
model_IR = impulseest(data);  

% Step 9: Compute Impulse Response and Confidence Interval
[IR, ki, ~, SD] = impulse(model_IR, 10);  

% Step 10: Display Impulse Response
figure;
stem(ki, IR, 'DisplayName', 'Impulse Response Coefficients'); grid on;

% Step 11: Add Confidence Bounds
hold on;
plot(ki, -SD, 'r--', 'DisplayName', 'Lower Confidence Bound');
plot(ki, SD, 'g--', 'DisplayName', 'Upper Confidence Bound');

% Step 12: Compute Theoretical FIR Coefficients
t_cof = filter(B, F, [1; zeros(10, 1)]);

hold on;
stem(ki, t_cof, 'bo', 'filled', 'DisplayName', 'Theoretical FIR Coefficients'); grid on; 
legend;

% Step 13: Define System Transfer Function
sys = tf(B, F, Ts);

% Simulate Step Response
t_final = 15;  
t = 0: Ts: t_final;  
[y_step, t_step] = step(sys, t);  

% Step 14: Plot Estimated Step Response
figure;
plot(t_step, y_step, 'r-', 'DisplayName', 'Estimated Step Response');
grid on;

% Step 15: Manual Step (Not included in script)

% Step 16: Compute Step Response Using Filter Function
step_input = ones(size(t));  
y_filter = filter(B, F, step_input);  

hold on;
plot(t, y_filter, 'b--', 'DisplayName', 'Step Response (Filter Function)');  
grid on;  
legend;
