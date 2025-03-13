clc; clear all;

load dryer2;

Ts = 0.08;  

whos;
dry = iddata(y2, u2, Ts);  

dry.InputName = 'Heater Voltage';  
dry.OutputName = 'Thermocouple Voltage';  
dry.TimeUnit = 'seconds';  
dry.InputUnit = 'V';  
dry.OutputUnit = 'V';

ze = dry(1 : 300);

figure;
plot(ze(200 : 300));
title('Data Interval of Sample from 200 to 300');

ze_zero_mean = detrend(ze);  

plot(ze_zero_mean(200 : 300)); 
title('Detrended Data Interval of Sample from 200 to 300');

impulse_response = impulseest(ze_zero_mean); 

impulse_plot = impulseplot(impulse_response);  
title('Impulse response coefficients');

showConfidence(impulse_plot, 3);  