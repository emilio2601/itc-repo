x0 = 0;
xf = 4;
dx = 0.1;
imax = (xf - x0) / dx;

f = @(x) (-2*x^3) + (12*x^2) - (20 * x) + 8.5;
x = linspace(x0, xf, imax);
y = zeros(1, imax);

y(1) = 1;

for k = 1:imax-1
    y(k + 1) = y(k) + (dx * f(x(k)));
end

plot(x, y)
title('Ejercicio 2')
xlabel('f(x)')
ylabel('x')