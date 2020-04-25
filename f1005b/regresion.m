x = [1, 2, 3, 4, 5];
y = [2, 4, 6, 8, 10];

mediax = mean(x);
mediay = mean(y);

numerador = dot(x-mediax, y-mediay);
denominador = dot(x-mediax, x-mediax);

b1 = numerador / denominador;
b0 = mediay -(b1 * mediax);

fprintf("y=%dx + %d\n", b1, b0);

scatter(x, y);
hold on;

zx = linspace(0, 50, 51);
zy = b0 + (b1 * zx);

plot(zx, zy);