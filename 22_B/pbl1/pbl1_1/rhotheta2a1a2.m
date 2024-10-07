clear clc
syms a3 a2 row theta_m theta_n r rn
eq1 = r*sin(theta_n+a2-theta_m) == row * sin(a2);
eq2 = r*sin(a3+a2-theta_m) == row * sin(a3+a2);
[sol_a3,sol_a2] = solve([eq1,eq2],[a3,a2]);
sol_a3
sol_a2
% simplify(sol_row)
% simplify(sol_theta_m)
% row
% theta_m


% sol_row = [-(r*sin(a2 - theta_n)*sqrt(-(cos(4*a1 + 2*a2 + 2*theta_n) + 6*cos(2*a1 + 2*a2) + 6*cos(2*a1 + 2*theta_n) + cos(2*a2 - 2*theta_n) + 16*cos(2*a1 + a2 + theta_n) + 24*cos(a1 + a2) + 24*cos(a1 + theta_n) + 4*cos(a1 - a2 + 2*theta_n) + 4*cos(a1 + 2*a2 - theta_n) + 4*cos(3*a1 + a2 + 2*theta_n) + 4*cos(3*a1 + 2*a2 + theta_n) + 16*cos(a2 - theta_n) + 18)/(cos(2*a1) - cos(2*a1 + 2*a2 - theta_n) + cos(2*a1 + 2*a2) + cos(2*a2 - theta_n) + cos(theta_n) - cos(2*a1 + theta_n) - 2)))/(cos(2*a1 + a2 + theta_n) + 2*cos(a1 + a2) + 2*cos(a1 + theta_n) + cos(a2 - theta_n) + 2); (r*sin(a2 - theta_n)*sqrt(-(cos(4*a1 + 2*a2 + 2*theta_n) + 6*cos(2*a1 + 2*a2) + 6*cos(2*a1 + 2*theta_n) + cos(2*a2 - 2*theta_n) + 16*cos(2*a1 + a2 + theta_n) + 24*cos(a1 + a2) + 24*cos(a1 + theta_n) + 4*cos(a1 - a2 + 2*theta_n) + 4*cos(a1 + 2*a2 - theta_n) + 4*cos(3*a1 + a2 + 2*theta_n) + 4*cos(3*a1 + 2*a2 + theta_n) + 16*cos(a2 - theta_n) + 18)/(cos(2*a1) - cos(2*a1 + 2*a2 - theta_n) + cos(2*a1 + 2*a2) + cos(2*a2 - theta_n) + cos(theta_n) - cos(2*a1 + theta_n) - 2)))/(cos(2*a1 + a2 + theta_n) + 2*cos(a1 + a2) + 2*cos(a1 + theta_n) + cos(a2 - theta_n) + 2)]
% sol_theta = [-(r*sin(a2 - theta_n)*sqrt(-(cos(4*a1 + 2*a2 + 2*theta_n) + 6*cos(2*a1 + 2*a2) + 6*cos(2*a1 + 2*theta_n) + cos(2*a2 - 2*theta_n) + 16*cos(2*a1 + a2 + theta_n) + 24*cos(a1 + a2) + 24*cos(a1 + theta_n) + 4*cos(a1 - a2 + 2*theta_n) + 4*cos(a1 + 2*a2 - theta_n) + 4*cos(3*a1 + a2 + 2*theta_n) + 4*cos(3*a1 + 2*a2 + theta_n) + 16*cos(a2 - theta_n) + 18)/(cos(2*a1) - cos(2*a1 + 2*a2 - theta_n) + cos(2*a1 + 2*a2) + cos(2*a2 - theta_n) + cos(theta_n) - cos(2*a1 + theta_n) - 2)))/(cos(2*a1 + a2 + theta_n) + 2*cos(a1 + a2) + 2*cos(a1 + theta_n) + cos(a2 - theta_n) + 2); (r*sin(a2 - theta_n)*sqrt(-(cos(4*a1 + 2*a2 + 2*theta_n) + 6*cos(2*a1 + 2*a2) + 6*cos(2*a1 + 2*theta_n) + cos(2*a2 - 2*theta_n) + 16*cos(2*a1 + a2 + theta_n) + 24*cos(a1 + a2) + 24*cos(a1 + theta_n) + 4*cos(a1 - a2 + 2*theta_n) + 4*cos(a1 + 2*a2 - theta_n) + 4*cos(3*a1 + a2 + 2*theta_n) + 4*cos(3*a1 + 2*a2 + theta_n) + 16*cos(a2 - theta_n) + 18)/(cos(2*a1) - cos(2*a1 + 2*a2 - theta_n) + cos(2*a1 + 2*a2) + cos(2*a2 - theta_n) + cos(theta_n) - cos(2*a1 + theta_n) - 2)))/(cos(2*a1 + a2 + theta_n) + 2*cos(a1 + a2) + 2*cos(a1 + theta_n) + cos(a2 - theta_n) + 2)]

% sol_x = sol_row.*cos(sol_theta)
% sol_y = sol_row.*sin(sol_theta)
% 
% sol_x1 = sol_x(1)
% sol_y1 = sol_y(1)
