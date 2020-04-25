x = [100, 226, 1000, 1348, 2019, 2700, 2800];
y = [2900, 1901, 208, 2000, 3406, 1987, 1200];

p   = polyfit(x, y, 3);
dp  = polyder(p);
d2p = polyder(dp);

xp = linspace(x(1), x(end), (x(end) - x(1)) + 1);
yp = polyval(p, xp);
hold on;
plot(xp, yp, 'LineWidth', 2); 

arc_len_func = @(x) sqrt(1 + polyval(dp, x).^2);
arc_len = IntSimpson(arc_len_func, 100, 2800, 5000);

fprintf("%.10f x^3 + %.10f x^2 + %.5f x + %.4f\n", p(1), p(2), p(3), p(4));
fprintf("y(100)  = %.2f\n", polyval(p, 100));
fprintf("y(2800) = %.2f\n", polyval(p, 2800));
fprintf("L(100, 2800) = %.2f\n", arc_len);

x_rc = linspace(0, 2800, 28001);
rc = @(x) ((1 + polyval(dp, x)^2)^(3/2)) / abs(polyval(d2p, x));
y_rc = arrayfun(rc, x_rc);

minrc_x1 = 0;
minrc_y1 = 0;

minrc_x2 = 0;
minrc_y2 = 0;

midpoint = round(length(y_rc)/2);
format long;

dn_idx_first = find(y_rc(1:midpoint) < 100);
dn_idx_second = find(y_rc(midpoint:end) < 100) + midpoint;
plot(x_rc(dn_idx_first), polyval(p, x_rc(dn_idx_first)), 'r', 'LineWidth', 2);
plot(x_rc(dn_idx_second), polyval(p, x_rc(dn_idx_second)), 'r', 'LineWidth', 2);

minrc_x1 = x_rc(dn_idx_first(1));
minrc_y1 = y_rc(dn_idx_first(1));

minrc_x2 = x_rc(dn_idx_second(1));
minrc_y2 = y_rc(dn_idx_second(1));

L = 80;
W = 10;
ang1 = polyval(dp, minrc_x1);
ang2 = polyval(dp, minrc_x2);

x1 = minrc_x1;
y1 = polyval(p, x1) - 20;
rect_pend(x1, y1, L, W, ang1);

x1_2 = minrc_x2;
y1_2 = polyval(p, minrc_x2) + 20;
rect_pend(x1_2, y1_2, L, W, ang2);

line_with_angle(x1, y1+20, L, ang1);
line_with_angle(x1_2, y1_2-2, L, ang2);

fprintf("Min rc en (%.2f, %.2f)\n", minrc_x1, minrc_y1);
fprintf("Min rc en (%.2f, %.2f)\n", minrc_x2, minrc_y2);

polymins_x = roots(dp);
polymins_y = polyval(p, polymins_x);

scatter(polymins_x, polymins_y, 'LineWidth', 2);

function line_with_angle(x, y, L, m)
    ang = atan(m);
    dx = x + (L * cos(ang));    
    dy = y + (L * sin(ang));
    plot([x, dx], [y, dy], 'g', 'LineWidth', 2);
end

function i = IntSimpson(func, start, final, n)
    x = linspace(start, final, n+1);
    y = arrayfun(func, x);
    acc = (y(1) + (4 * sum(y(2:2:end-1))) + (2 *sum(y(3:2:end-1))) + y(end));
    i = (((final-start)/n)/3) * acc;
end

function rect_pend(x, y, w, h, m)
    ang  = atan(m);
    ang_ = atan(-1/m);
    dx = w*cos(ang);
    dy = w*sin(ang);
    hy = h*sin(ang_);
    hx = h*cos(ang_);
    x = [x, x + dx, x + dx - hx, x - hx, x];
    y = [y, y + dy, y + dy - hy, y - hy, y];
    plot(x,y);
end





