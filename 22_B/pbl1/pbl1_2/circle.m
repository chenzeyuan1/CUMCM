function r = circle(m,n,a2)

R = 100;
x0 = R*cos(2*pi/9 *(m-1));
y0 = R*sin(2*pi/9 *(m-1));
theta1 = 2*pi/9 *(n-1);
a2min = a2;
a2max = a2+pi/9;
alpha2 = a2max;
%C1是外切圆的情况
r1 = [-(R + sqrt(R^2*cos(alpha2 + theta1)^2 + R^2*sin(alpha2 + theta1)^2 - 4*R*x0*sin(alpha2 + theta1)*sin(alpha2) + 4*R*y0*cos(alpha2 + theta1)*sin(alpha2) + 4*x0^2*sin(alpha2)^2 + 4*y0^2*sin(alpha2)^2))/(2*sin(alpha2)); -(R - sqrt(R^2*cos(alpha2 + theta1)^2 + R^2*sin(alpha2 + theta1)^2 - 4*R*x0*sin(alpha2 + theta1)*sin(alpha2) + 4*R*y0*cos(alpha2 + theta1)*sin(alpha2) + 4*x0^2*sin(alpha2)^2 + 4*y0^2*sin(alpha2)^2))/(2*sin(alpha2))];
idxr1 = r1>0;
r1 = r1(idxr1);
% C1是内切圆的情况


R = 100;
x0 = R*cos(2*pi/9 *(m-1));
y0 = R*sin(2*pi/9 *(m-1));
theta1 = 2*pi/9 *(n-1);
alpha2_ = a2min;
r2 = R/(2*sin(alpha2_)) - sqrt((y0 + (R*cos(alpha2_ + theta1))/(2*sin(alpha2_)))^2 + (x0 - (R*sin(alpha2_ + theta1))/(2*sin(alpha2_)))^2);

% r2 = r2(1)
r2 = abs(r2)
r = min(r1,r2);


end