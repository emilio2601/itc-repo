f = @(x) sin(x);

x0 = 0;
xf = pi;
n = 10;
dt = (xf - x0) / n;
x = linspace(x0, xf, n+1);
y = arrayfun(f, x);

acc = y(1) + (4 * sum(y(2:2:end-1))) + (2 * sum(y(3:2:end-1))) + y(end);
i = acc * (dt / 3);
format long;
disp(i);
disp(i - 2);
    