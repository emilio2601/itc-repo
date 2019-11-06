% Emilio Mendoza Palafox  A00344575
% Alberto Cort�s Gonz�lez A01635875 

% Ejercicio 1: Grafica y = sin(t) con t�tulo y etiquetas en ejes

x = 0:pi/40:4*pi;
y = sin(x);

plot(x, y);
title('sin(t)');
xlabel('t');
ylabel('f(t)');

% Ejercicio 2: Grafica m�ltiples funciones

x = 0:0.01:5;

y1 = exp(-0.5 * x) .* cos(15 * x);
y2 = -2 * x + 2;
y3 = (x.^2 - x + 3) ./ (x - 8);

plot(x, y1, x, y2, x, y3);
title('Gr�ficas de m�ltiples funciones');
xlabel('0 <= t <= 5');

% Ejercicio 3: Grafica m�ltiples funciones con llamadas separadas a plot()

x = 0:0.01:5;

y1 = exp(-0.5 * x) .* cos(15 * x);
y2 = -2 * x + 2;
y3 = (x.^2 - x + 3) ./ (x - 8);

hold on;
plot(x, y1);
plot(x, y2);
plot(x, y3);
hold off;

title('Gr�ficas de m�ltiples funciones');
xlabel('0 <= t <= 5');

% Ejercicio 5: Funci�n cu�rtica y sus derivadas

x = -5:0.01:5;

y1 = 2*x.^4 + 15*x.^2;
y2 = 8*x.^3 + 30*x;
y3 = 24*x.^2 + 15;
y4 = 48 * x;


hold on;
grid on;
plot(x, y1, '-');
plot(x, y2, ':');
plot(x, y3, '--');
plot(x, y4, '-.');
hold off;

title('Funci�n cu�rtica y sus derivadas');
xlabel('x');
ylabel('f(x)');

