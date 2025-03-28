clc;
close all;

a = [1 -1.2 -1 0.5];

cond1 = abs(a(4)) < a(1);
D = a(1)*a(3) - a(4)*a(2);
cond2 = abs(D) < a(1)*a(4);

first_row = a;
second_row = fliplr(a);
third_row = zeros(1, 3);
third_row(1) = (second_row(1)*first_row(2) - first_row(1)*second_row(2)) / second_row(1);
third_row(2) = (second_row(1)*first_row(3) - first_row(1)*second_row(3)) / second_row(1);
third_row(3) = (second_row(1)*first_row(4) - first_row(1)*second_row(4)) / second_row(1);

cond3 = third_row(1) > 0;

if cond1 && cond2 && cond3
    disp('The system is stable')
else
    disp('The system is unstable')
end
