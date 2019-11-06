x0 = 0;
xf = 30;
dx = 0.5;
imax = (xf - x0) / dx;

f = @(x)  10 - sqrt(x);
x = linspace(x0, xf, imax);
y = zeros(1, imax);

y(1) = 5;

for k = 1:imax-1
    y(k + 1) = y(k) + (dx * f(x(k)));
end

plot(x, y)
title('Ejercicio 1')
xlabel('f(x)')
ylabel('x')