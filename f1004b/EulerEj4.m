x0 = 0;
xf = 5;
dx = 0.01;
imax = (xf - x0) / dx;

f = @(x) 8*x - 2;
x = linspace(x0, xf, imax);
y = zeros(1, imax);

y(1) = 1;

for k = 1:imax
    y(k + 1) = y(k) + (dx * f(x(k)));
   
end

plot(x(1:imax/5), y(1:imax/5))
title('Ejercicio 4')
xlabel('f(x)')
ylabel('x')
fprintf("Cuando t=4.5, x=%f", y(4.5/dx));