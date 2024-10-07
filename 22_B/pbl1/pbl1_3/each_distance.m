function d = each_distance(r,theta)
ideal_theta = 0:2*pi/9:16*pi/9;
R = ones(1,9)*100;
ideal_x = R.*cos(ideal_theta);
ideal_y = R.*sin(ideal_theta);
real_x = r.*cos(theta);
real_y = r.*sin(theta);
d = (ideal_y-real_y).^2+(ideal_x-real_x).^2;
end