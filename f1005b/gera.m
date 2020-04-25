clear all
clc;

hold on;
x = [300,900,2200,2800];
y = [2300,-1000,3150,200];

format long
p = polyfit(x,y,3);

f = @(x) p(1)*x.^3 + p(2)*x.^2 + p(3)*x + p(4);
df = @(x) 3*p(1)*x.^2 + 2*p(2)*x + p(3);
df2 = @(x) 6*p(1)*x + 2*p(2);

dev = polyder(p);

res = roots(dev);
fprintf('El punto minimo es : %f\n',res(2));
fprintf('El punto maximo es : %f\n',res(1));

x1 = (300:5:2800);
y1= f(x1);

fl = @(x) (1+df(x).^2).^(1/2); 
longitud = simpson(fl,300, 2800, 50);
fprintf('Longitud es de %f\n',longitud)

min = 862:1:880;
df2_min = df2(min);
df_min = df(min);
max = 2000:0.01:2400;

radioc_min = ((1+df_min.^2)).^(3/2)./abs(df2_min);
radioc_max = ((1+df_min.^2)).^3./abs(df2_min);

cfric = 0.6;
peral = 0.04;

[vel_min,vel_max] = velocidad(cfric,peral,radioc_min,radioc_max);

T = table(vel_min,vel_max,min,radioc_min);
T.Properties.VariableNames = {'Velocidad minimo','Velocidad maxima','Min','Radio curvatura min y max'};
summary(T)

n = 1;
for i = radioc_min
    if i < 100
        fprintf("Punto de derrape: %f \n",min(n));
        der_minx = min(n);
        grada(der_minx,f(der_minx)-20,80,10,polyval(dev,der_minx));
        break
    end
    n = n + 1;
end

m_min= df(der_minx);
b = f(der_minx) - df(der_minx) * der_minx;

tan_min=@(x) m_min.*x+b;
tan_parx = @(x) m_min.*x + (b-20);

tan_miny=tan_min(x1);
tan_minypar = tan_parx(x1);

n2 = 1;
for i = radioc_max
    if i < 100
        fprintf("Punto de derrape: %f\n",max(n2));
        der_maxx = max(n2);
        grada(der_maxx,f(der_maxx)+20,80,10,polyval(dev,der_maxx));
        break
    end
    n2 = n2 + 1;
end

m_max = df(der_maxx);
b2 = f(der_maxx) - df(der_maxx) * der_maxx;

tan_max = @(x) m_max.*x+b2;
tany_max = tan_max(x1);

tan_par = @(x) m_max.*x + (b2+20);
maxy_par = tan_par(x1);

plot(x1,y1);

plot(x1,tan_miny);
plot(x1,tan_minypar);
plot(x1,tany_max);
plot(x1,maxy_par);


function grada(x, y, wid, halt, m)
    angulo  = atan(m);
    angulo_2 = atan(-1/m);
    dx = wid * cos(angulo);
    halt_x = halt * cos(angulo_2);
    dy = wid * sin(angulo);
    halt_y = halt * sin(angulo_2);
    x = [x, x + dx, x + dx - halt_x, x - halt_x, x];
    y = [y, y + dy, y + dy - halt_y, y - halt_y, y];
    plot(x,y);
end

function sum = simpson(f,a,b,n)  
    sum_p = 0;
    sum_i = 0;
    
    h = (b-a)/n;
    x = a:h:b;
    for i = 2:1:n
        if mod(i,2) ~= 0 
        %los pares en este caso son los impares asi que si entre dos es
        %igual a cero siginifica es impar y si no es par
            sum_p = sum_p + f(x(i));
        else
            sum_i = sum_i + f(x(i));
        end
    end
    
    sum = (b - a) * (f(x(1)) + 4 * sum_i + 2 * sum_p + f(x(end))) / (3 * n);
end

function [vel_min,vel_max] = velocidad(cfric,peral,radioc_min,radioc_max)
    raiz_min = (((cfric.*radioc_min)+peral)/(1-(cfric.*peral))).^1/2;
    vel_min = 11.3 .* raiz_min; 
    raiz_max = (((cfric.*radioc_max)+peral)/(1-(cfric.*peral))).^1/2;
    vel_max = 11.3 .* raiz_max;
end