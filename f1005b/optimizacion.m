a = optimvar('a', 1, 4);

% ax^3 (1) + bx^2 (2) + cx (3) + d (4)
% 3ax^2 + 2bx + c

start_point_ctrt_2 = (a(1) * (100^3)) + (a(2) * (100^2)) + (a(3) * 100) + a(1)  <= 2805;
end_point_ctrt     = (a(1) * (2800^3)) + (a(2) * (2800^2)) + (a(3) * 2800) + a(4) == 1200;
end_point_ctrt_2   = (a(1) * (2800^3)) + (a(2) * (2800^2)) + (a(3) * 2800) + a(4) <= 1205;

syms x;
%length_expr = sqrt(1 + ( ( v(3) + (2*v(2)*x) + (3*v(1)*x^2) )^2) );

obj = @(v) double(vpaintegral(sqrt(1 + ( ( v(3) + (2*v(2)*x) + (3*v(1)*x^2) )^2) ), 100, 2800)) - 5000;
obj_expr = fcn2optimexpr(obj, a);

prob = optimproblem('Objective', obj_expr);

prob.Constraints.circlecons = circlecon(a);

show(prob);

a0.a = [100 0 10 30];
[sol, fval, exitflag, output] = solve(prob, a0);


disp(fval);
disp(exitflag);
disp(output);

fprintf("Resultado: ");
disp(sol.a);
fprintf("y(100)  = %.2f\n", polyval(sol.a, 100));
fprintf("y(2800) = %.2f\n", polyval(sol.a, 2800));
fprintf("L(100, 2800) = %.2f\n", obj(sol.a) + 5000);

function [c,ceq] = circlecon(a)
   c(1) = (a(1) * (100^3)) + (a(2) * (100^2)) + (a(3) * 100) + a(1) == 2800;
   c(2) = (a(1) * (2800^3)) + (a(2) * (2800^2)) + (a(3) * 2800) + a(4) == 1200;
   ceq = [];
end