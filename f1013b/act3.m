clear all;

t = 0:0.1:3;
x = 5.*t + 10;
y = 50 - (9.81*t.^2)/2;

comet(x,y);
grid on;