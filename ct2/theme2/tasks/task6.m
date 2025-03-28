clc;

syms k z;

F = z / ((z + 0.5) * (z + 3));
f = iztrans(F, k);

disp(f);
