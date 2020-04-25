f = @(x) x^2;

x0 = 0;
xf = 10;
dt = 0.01;

int_acc = 0;
n = (xf - x0) / dt;

for k = 1:n 
    val = f(x0 + (dt/2));
    x0 = x0 + dt;

    int_acc = int_acc + (val * dt);
end

disp(int_acc);