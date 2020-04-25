f_x = [0, 2, 12];
f_y = [30, 35, 35];

g_x = [35, 46, 52];
g_y = [10, 22, 20];


f = polyfit(f_x, f_y, 2);
df = polyder(f);
f_xeval = linspace(0, 12, 121);
f_yeval = polyval(f, f_xeval);

g = polyfit(g_x, g_y, 2);
dg = polyder(g);
g_xeval = linspace(35, 52, 121);
g_yeval = polyval(g, g_xeval);

A = [12^3 12^2 12 1; 35^3 35^2 35 1; 3*(12)^2 24 1 0; 3*(35)^2 70 1 0];
B = [35; 10; -2.08; 2.01];

h = linsolve(A, B);
dh = polyder(h);
h_xeval = linspace(12, 35, 24);
h_yeval = polyval(h, h_xeval);

arclen_h = @(x) sqrt(1 + polyval(dh, x).^2);
len = integral(arclen_h, 12, 35);

hold on;
title('Secciones de la montaña rusa');
xlabel('x (metros)');
ylabel('y (metros)');
xlim([0 52]);
ylim([0 50]);
plot(f_xeval, f_yeval);
plot(g_xeval, g_yeval);
plot(h_xeval, h_yeval);

