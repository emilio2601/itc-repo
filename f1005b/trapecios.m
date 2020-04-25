f = @(x) x^2;

x0 = 0;
xf = 10;
dt = 1;

int_acc = 0;
higher = f(x0);

n = (xf - x0) / dt;

for k = 1:n 
    x0 = x0 + dt;
    lower = higher;
    higher = f(x0);
    
    int_term = (higher + lower) * (dt / 2);
    int_acc = int_acc + int_term;
end

disp(int_acc);