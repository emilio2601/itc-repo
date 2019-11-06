% Emilio Mendoza Palafox  A00344575
% Alberto Cortés González A01635875 

% Función cuártica y sus derivadas

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

title('Función cuártica y sus derivadas');
xlabel('x');
ylabel('f(x)');
