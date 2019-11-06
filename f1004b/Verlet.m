clear all
clc
dt       = 0.01; % s
cd       = 0.6;
g        = 9.81; % m/s2
rho_roca = 2;     % g/cm3
rho_air  = 1.18;  % kg/m3
x0       = 0;    % m
y0       = 367;  % m

vo       = input("Ingresa la velocidad incial (80-500) m/s: ");
diametro = input("Ingresa el diametro del objeto (m): ");
angulo   = deg2rad(input("Ingresa el ángulo de tiro (10-80) °: "));

volumen = 4/3 * pi * (diametro/2)^3; % m3
area = pi * (diametro/2)^2;          % m2
masa = volumen * rho_roca * 1000;    % kg

b = 0.5 * cd * rho_air * area;

vox = vo * cos(angulo);
voy = vo * cos(angulo);

[x, y] = verlet(x0, y0, vox, voy, b, g, masa, dt);

plot(x, y);
axis([0 inf 0 inf]);

function [x, y] = verlet(x0, y0, vox, voy, b, g, masa, dt)
    xmin = x0 - (vox * dt);
    ymin = y0 - (voy * dt) - (0.5 * g * dt^2);
    
    t(1) = -dt;
    t(2) = 0;
    
    x(1) = xmin;
    y(2) = y0;
    
    y(1) = ymin;
    x(2) = x0;
    
    iter_count = 2;
    
    while y(end) >= 0
        iter_count = iter_count + 1;
        m2m2bt = (2 * masa) / ((2 * masa) + (b * dt));
        bdt2m  = (b * dt) / (2 * masa);
        x(iter_count) = m2m2bt * ((2 * x(iter_count - 1)) + ((bdt2m -1) * x(iter_count - 2)));
        y(iter_count) = m2m2bt * ((2 * y(iter_count - 1)) + ((bdt2m -1) * y(iter_count - 2) - (g*dt*dt)));
    end
end