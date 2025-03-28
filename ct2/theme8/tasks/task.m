clc;
clear;

A = [0 1; 0 -5];
B = [0; 100];
C = [1 0];
D = 0;
T0 = 0.01;

sys_c = ss(A, B, C, D);
sys_d = c2d(sys_c, T0, 'zoh');
[G, H, C_d, D_d] = ssdata(sys_d);

M = ctrb(G, H);
if rank(M) ~= size(G, 1)
    error('System is NOT controllable.');
end

z1 = [0.95, 0.97];
K1 = acker(G, H, z1);
K0_1 = inv(C_d * inv(eye(2) - G + H * K1) * H);

z2 = [0.95, 0.85];
K2 = acker(G, H, z2);
K0_2 = inv(C_d * inv(eye(2) - G + H * K2) * H);

disp('G:'); disp(G);
disp('H:'); disp(H);
disp('K1:'); disp(K1);
disp('K0_1:'); disp(K0_1);
disp('K2:'); disp(K2);
disp('K0_2:'); disp(K0_2);

sys_cl1 = ss(G - H*K1, H*K0_1, C_d, D_d, T0);
sys_cl2 = ss(G - H*K2, H*K0_2, C_d, D_d, T0);

t = 0:T0:5;
r = 10*ones(size(t));

[y1, t1, x1] = lsim(sys_cl1, r, t);
[y2, t2, x2] = lsim(sys_cl2, r, t);

figure;
subplot(2,1,1);
plot(t1, y1, 'b', 'LineWidth', 2);
title('Output y(t) for K1 (0.95, 0.97)');
xlabel('Time [s]');
ylabel('y(t)');
grid on;

subplot(2,1,2);
plot(t2, y2, 'r', 'LineWidth', 2);
title('Output y(t) for K2 (0.95, 0.85)');
xlabel('Time [s]');
ylabel('y(t)');
grid on;
