a = optimvar('a', 1, 2);

% a(1) - radio interior, a(2) - altura interior

obj = @(a) pi * (a(1) +0.5)^2 * (a(2) + 1) - (16 * pi);
obj_expr = fcn2optimexpr(obj, a);

prob = optimproblem('Objective', obj_expr);
prob.Constraints.circlecons = circlecon(a);

show(prob);

a0.a = [1 1];
[sol, fval, exitflag, output] = solve(prob, a0);

disp(fval);
disp(exitflag);
disp(output);

fprintf("Resultado: ");
disp(sol.a);

function [c,ceq] = circlecon(a)
   c(1) = a(1) >= 0;
   c(2) = a(2) >= 0;
   ceq = [];
end
