function [a2,a3] = rho2a2a3(row,theta_m,theta_n)
%UNTITLED26 此处显示有关此函数的摘要
%   此处显示详细说明
a3 = [- 2*atan((sqrt(r^2 - 2*cos(theta_m)*r*row + row^2) - row + r*cos(theta_m))/(r*sin(theta_m))) - 2*atan(-(sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - row + r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))); 2*atan(-(row + sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))) - 2*atan((sqrt(r^2 - 2*cos(theta_m)*r*row + row^2) - row + r*cos(theta_m))/(r*sin(theta_m))); 2*atan((row + sqrt(r^2 - 2*cos(theta_m)*r*row + row^2) - r*cos(theta_m))/(r*sin(theta_m))) - 2*atan(-(sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - row + r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))); 2*atan(-(row + sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))) + 2*atan((row + sqrt(r^2 - 2*cos(theta_m)*r*row + row^2) - r*cos(theta_m))/(r*sin(theta_m)))];
a2 = [-2*atan((sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - row + r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))); 2*atan((row + sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))); -2*atan((sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - row + r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n))); 2*atan((row + sqrt(r^2 - 2*cos(theta_m - theta_n)*r*row + row^2) - r*cos(theta_m - theta_n))/(r*sin(theta_m - theta_n)))];
a3 = a3(1);
a2 = a2(1);

end