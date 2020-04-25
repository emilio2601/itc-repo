f = @(x) x^2;

x0 = 0;
xf = 10;
dt = 1;
x = linspace(x0+(dt/2), xf-(dt/2), ((xf - x0) / dt));
y = arrayfun(f, x);

disp(sum(y) * dt);