clc;
close all;

coefficients = [1, 1, 2, 12, 10];

% Function to create the Routh array
function routhArray = createRouthArray(coeffs)
    n = length(coeffs);
    m = ceil(n / 2);
    
    % Initialize the Routh array with zeros
    routhArray = zeros(n, m);
    
    % Fill the first two rows of the Routh array
    routhArray(1, :) = coeffs(1:2:end);
    routhArray(2, 1:length(coeffs(2:2:end))) = coeffs(2:2:end);
    
    % Calculate remaining rows
    for i = 3:n
        for j = 1:m-1
            routhArray(i, j) = (routhArray(i-1, 1) * routhArray(i-2, j+1) - routhArray(i-2, 1) * routhArray(i-1, j+1)) / routhArray(i-1, 1);
        end
        
        if routhArray(i, 1) == 0
            routhArray(i, 1) = 1e-6;
        end
    end
end

routhArray = createRouthArray(coefficients);

firstColumn = routhArray(:, 1);
numSignChanges = sum(diff(sign(firstColumn)) ~= 0);

% Display the stability result
if numSignChanges == 0
    disp('The system is stable (all roots are in the left half-plane).');
else
    disp(['The system is unstable (there are ', num2str(numSignChanges), ' roots in the right half-plane).']);
end
