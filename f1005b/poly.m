x = linspace(0, 4*pi, 50);
y = sin(x);
p = polyfit(x, y, 15);
hold on;
plot(x, y);
scatter(x, polyval(p, x));