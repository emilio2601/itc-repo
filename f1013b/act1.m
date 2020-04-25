clear all;

t = -2:0.1:3;
x = t.^2 - 4;
y = t/2;

comet(x,y);
grid on;