clc;
close all;


numerator = 8;
denominator = [2, 3, 1];
taus = [0.2, 0.4, 0.8, 1.6, 3.2];

for i = 1:length(taus)
    tau = taus(i);
    W = tf(numerator, denominator, 'InputDelay', tau);

    figure;
    nyquist(W);
    title(['Nyquist Plot for \tau = ', num2str(tau), ' s']);
end
