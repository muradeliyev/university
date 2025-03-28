clc;
close all;

% Load the input-output data
load dryer2;  % Ensure the data file 'dryer2' is available

% Create an iddata object
Ts = 0.08;  % Sampling time
dry = iddata(y2, u2, Ts);

% Assign names and units
dry.InputName = 'Heater Voltage';
dry.OutputName = 'Thermocouple Voltage';
dry.TimeUnit = 'seconds';
dry.InputUnit = 'V';
dry.OutputUnit = 'V';

% Choose the first 300 data points for model estimation
ze = dry(1:300);

% Plot the interval from sample 200 to 300
figure;
plot(ze(200:300));
xlabel('Time (seconds)');
ylabel('Thermocouple Voltage (V)');
title('Output Data from Sample 200 to 300');
grid on;

% Remove constant levels (detrend data)
ze_detrended = detrend(ze);

% Plot the same interval for comparison
figure;
plot(ze.Time(200:300), ze_detrended.OutputData(200:300));
xlabel('Time (seconds)');
ylabel('Thermocouple Voltage (Zero-Mean)');
title('Detrended Output Data from Sample 200 to 300');
grid on;

% Estimate the impulse response using correlation analysis
impulse_response = impulseest(ze);

% Plot the impulse response coefficients
figure;
impulseplot(impulse_response);
title('Impulse Response of the System');
grid on;

% Show 3 standard deviations of confidence region
showConfidence(gca, 3);
