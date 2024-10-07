function d = sst(r,theta)
    % ideal_theta = 0:2*pi/9:16*pi/9;
% R = ones(1,9)*100;
% ideal_x = R.*cos(ideal_theta);
% ideal_y = R.*sin(ideal_theta);
real_x = r.*cos(theta);
real_y = r.*sin(theta);
d = (real_y.^2+real_x.^2).^0.5;
d_mean = mean(d);
d = sum((d-d_mean).^2);
end
