x = [300, 900, 2200, 2800];
y = [2300, -1200, 3200, 200];

p = polyfit(x, y, 3);
dp  = polyder(p);
d2p = polyder(dp);

X = 300:5:2800;
Y = polyval(p, X);

arc_len_func = @(x) sqrt(1 + polyval(dp, x).^2);
arc_len = integral(arc_len_func, 300, 2800);

fprintf("L(300, 2800) = %.2f\n", arc_len);

x_rc = linspace(300, 2800, 28001);
rc = @(x) ((1 + polyval(dp, x)^2)^(3/2)) / abs(polyval(d2p, x));
y_rc = arrayfun(rc, x_rc);

hold on;
plot(x, y, 'or', X, Y, 'b--');
plot(x_rc, y_rc);
yline(100);
ylim([-1000 3000]);