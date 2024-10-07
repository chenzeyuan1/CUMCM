syms rho_m rho_n rho_p theta_p theta_m theta_n a2p a3p a2n a3n xm ym
%p
xp = rho_p * cos(theta_p);
yp = rho_p * sin(theta_p);
% % m
% xm = rho_m * cos(theta_m);
% ym = rho_m * sin(theta_m);
%n
xn = rho_n * cos(theta_n);
yn = rho_n * sin(theta_n);
%00
x0 = 0;
y0 = 0;
%01
x01 = 100 * cos(0);
y01 = 100 * sin(0);

%圆心坐标   
syms x_op y_op  %圆0 p m
syms x_np y_np  %圆n p m
syms x_on y_on  %圆0 n m
syms x_o1 y_o1  %圆0 1 m
syms x_n1 y_n1  %圆n 1 m
syms x_p1 y_p1  %圆p 1 m

%圆0、m、p的方程
r_0mp = rho_p/(2*sin(a2p));
% eq1 = (xp - x_op)^2 + (yp - y_op)^2 == r_0mp^2;
eq2 = (xm - x_op)^2 + (ym - y_op)^2 == r_0mp^2;
eq3 = (x0 - x_op)^2 + (y0 - y_op)^2 == r_0mp^2;
%圆n、m、p的方程
r_nmp = sqrt((xp-xn)^2+(yp-yn)^2)/(2*sin(a2n-a2p));
% eq4 = (xp - x_np)^2 + (yp - y_np)^2 == r_nmp^2;
eq5 = (xm - x_np)^2 + (ym - y_np)^2 == r_nmp^2;
eq6 = (xn - x_np)^2 + (yn - y_np)^2 == r_nmp^2;

%圆0、n、m的方程
r_onm = rho_n/(2*sin(a2n));
% eq7 = (xn - x_on)^2 + (yn - y_on)^2 == r_onm^2;
eq8 = (xm - x_on)^2 + (ym - y_on)^2 == r_onm^2;
eq9 = (x0 - x_on)^2 + (y0 - y_on)^2 == r_onm^2;

%圆0、1、m的方程
r_o1m = 100/(2*sin(a2p+a3p));
eq10 = (x01 - x_o1)^2 + (y01 - y_o1)^2 == r_o1m^2;
% eq11 = (xm - x_o1)^2 + (ym - y_o1)^2 == r_o1m^2;
eq12 = (x0 - x_o1)^2 + (y0 - y_o1)^2 == r_o1m^2;

%圆n、1、m的方程
r_n1m = sqrt((x01-xn)^2+(y01-yn)^2)/(2*sin(a3n));
% eq13 = (x01 - x_n1)^2 + (y01 - y_n1)^2 == r_n1m^2;
eq14 = (xm - x_n1)^2 + (ym - y_n1)^2 == r_n1m^2;
eq15 = (xn - x_n1)^2 + (yn - y_n1)^2 == r_n1m^2;

%圆p、1、m的方程
r_p1m = sqrt((x01-xp)^2+(y01-yp)^2)/(2*sin(a3p));
% eq16 = (x01 - x_p1)^2 + (y01 - y_p1)^2 == r_p1m^2;
eq17 = (xm - x_p1)^2 + (ym - y_p1)^2 == r_p1m^2;
eq18 = (xp - x_p1)^2 + (yp - y_p1)^2 == r_p1m^2;

%解方程
% [sol_x_op,sol_y_op,sol_x_np,sol_y_np,sol_x_on,sol_y_on,sol_x_o1,sol_y_o1,sol_x_n1,sol_y_n1,sol_x_p1,sol_y_p1,sol_xm,sol_ym] = solve([eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10,eq11,eq12,eq13,eq14,eq15,eq16,eq17,eq18],[x_op,y_op,x_np,y_np,x_on,y_on,x_o1,y_o1,x_n1,y_n1,x_p1,y_p1,xm,ym],'Real',true);  
[sol_x_op,sol_y_op,sol_x_np,sol_y_np,sol_x_on,sol_y_on,sol_x_o1,sol_y_o1,sol_x_n1,sol_y_n1,sol_x_p1,sol_y_p1,sol_xm,sol_ym] = solve([eq2,eq3,eq5,eq6,eq8,eq9,eq10,eq12,eq14,eq15,eq17,eq18],[x_op,y_op,x_np,y_np,x_on,y_on,x_o1,y_o1,x_n1,y_n1,x_p1,y_p1,xm,ym],'Real',true);  
sol_xm
sol_ym