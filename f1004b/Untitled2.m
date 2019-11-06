clear all
clc
tinicial=0;
tfinal=30;
h=0.5;
t(1)=0;
x(1)=5;
f(1)=10 - sqrt(x(1));

nmax=(tfinal-tinicial)/h;
for k=1:nmax
    t(k+1)=t(k)+h;
    x(k+1)=x(k)+h*(f(k));
    f(k+1)=10 - sqrt(x(k+1));
end
plot(t,x,'o')
hold on
plot(t,x,'--')
title('Aprox. con el Metodo de Euler partiendo de dx/dt = 10 - sqrt(x)')
xlabel('t')
ylabel('x')
hold off