f = @(x) (x^2 - 2) / (x);

x0 = 1;
xf = 2;
dt = 1/10;
x = linspace(x0, xf, ((xf - x0) / dt)+1);
y = arrayfun(f, x);

res = sum(movmean(y, 2, 'Endpoints', 'discard')) * dt;

disp(res);
disp(res - 2);