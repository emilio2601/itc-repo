% Emilio Mendoza Palafox  A00344575
% Alberto Cortés González A01635875 

% Grafica múltiples funciones

x = 0:0.01:5;

y1 = exp(-0.5 * x) .* cos(15 * x);
y2 = -2 * x + 2;
y3 = (x.^2 - x + 3) ./ (x - 8);

plot(x, y1, x, y2, x, y3);
title('Gráficas de múltiples funciones');
xlabel('0 <= t <= 5');
