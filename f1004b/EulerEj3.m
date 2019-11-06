x0 = 0;
xf = 5;
dx = 0.001;
imax = (xf - x0) / dx;

f = @(x) -2 * (x - 3) * exp(-2*(x-3)) + 1; 
x = linspace(x0, xf, imax);
y = zeros(1, imax);

y(1) = 1;

for k = 1:imax-1
    y(k + 1) = y(k) + (dx * f(x(k)));
end

plot(x, y)
title('Ejercicio 3')
xlabel('f(x)')
ylabel('x')