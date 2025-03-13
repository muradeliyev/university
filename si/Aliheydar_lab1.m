clc; clear; close all

% Task 1 - Generate input and output data
input1 = sign(randn(200, 2));
output1 = randn(200, 1);
sampleTime = 0.1;

% Task 2 - Create iddata object
dataSet1 = iddata(output1, input1, sampleTime);

% Task 3 - Plot first input channel
figure
plot(dataSet1(:, 1, 1)); grid on; % Modify indexing here if needed

% Task 4 - Extract data
get(dataSet1, 'y');
get(dataSet1, 'u');

dataSet1.y;
dataSet1.u(:, end);

% Task 5 - Extract subset of data
dataSubset = dataSet1(:, 1, 2);

% Task 6 - Assign input and output names
dataSet1.inputn = {'Voltage', 'Current'};
dataSet1.outputn = 'AngularSpeed';

% Task 7 - Set input and output units
dataSet1.InputUnit = {'V', 'A'};
dataSet1.OutputUnit = 'm/s';

set(dataSet1, 'InputName', {'Voltage', 'Current'}, 'OutputName', 'AngularSpeed', 'InputUnit', {'V', 'A'}, 'OutputUnit', 'm/s');

% Task 8 - Display dataSet1 properties in command window
% Using: get(dataSet1)

% Task 9 - Create new dataset
input2 = ones(200, 1);
output2 = rand(200, 1);
dataSet2 = iddata(output2, input2, sampleTime);
set(dataSet2, 'InputName', 'Custom Input', 'OutputName', 'Custom Output');

% Task 10 - Combine datasets
dataCombined = [dataSet1 dataSet2];

% Task 11 - Plot different dataset channels
figure
plot(dataCombined(:, 1, 3)); grid on;

figure
plot(dataCombined(:, 2, 2)); grid on;

% Task 12 - Generate sinusoidal input
sineInput = idinput([30 1 10], 'sine');

figure 
plot(sineInput); grid on;

% Task 13 - Create dataset with periodic signal
sampleTime2 = 1;
dataSet3 = iddata([], sineInput, sampleTime2, 'Period', 30);

% Task 14 - 17 - Define system and simulate response
numCoeff = [1 -1.5 0.7];
denCoeff = [0 1 0.5];

sysModel = idpoly(numCoeff, denCoeff);
outputSim = sim(sysModel, dataSet3, simOptions('AddNoise', true));
dataFinal = [dataSet3 outputSim];
