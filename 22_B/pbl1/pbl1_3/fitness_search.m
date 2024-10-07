%优化函数
function d = sum_distance_one(x)
    % 假设x前半部分是r，后半部分是theta
    n = length(x)/2;
    r = x(1:n);
    theta = x(n+1:end);
    ideal_theta = 0:2*pi/9:16*pi/9;
    R = ones(1,9)*100;
    ideal_x = R.*cos(ideal_theta);
    ideal_y = R.*sin(ideal_theta);
    real_x = r.*cos(theta);
    real_y = r.*sin(theta);
    d = sum((ideal_y-real_y).^2+(ideal_x-real_x).^2);
end

function stop = plotOptimValues(x, optimValues, state)
    stop = false; % 如果你想基于某些条件停止优化过程，可以设置这个变量为true
    switch state
        case 'iter'

            disp(['当前迭代次数: ', num2str(optimValues.iteration)]);
            disp(['当前x的值: ', num2str(x)]);
            % n = length(x)/2;
            % r_ = x(1:n);
            % theta_ = x(n+1:end);
            % x_ = r_.*cos(theta_);
            % y_ = r_.*sin(theta_);
            % scatter(x_,y_);
            % a1_ = t2angle([0,0],[x_,y_],[100,0]);
            % 绘制当前解或其他信息
            % 例如，绘制当前函数值
            hold on;
            % plot(optimValues.iteration, optimValues.fval, 'o');
            % plot(optimValues.iteration, a1_, 'o');
             % 保持图像，以便在同一图上绘制所有点
            axis equal;
            scatter(x_,y_);
            xlabel('x');
            ylabel('y');
            % legend

            drawnow; % 立即更新图形
    end
end

%初始值
r = [100 98 112 105 98 112 105 98 112];
theta = [0 40.10 80.21 119.75 159.86 199.96 240.07 280.17 320.28];
x0 = [r,theta];

%无条件约束,寻找全局最优解
% 创建一个匿名函数
objFun = @(x) sum_distance_one(x);

% 在optimoptions中设置OutputFcn
options = optimoptions('fminunc', 'Display', 'iter', 'Algorithm', 'quasi-newton', 'OutputFcn', @plotOptimValues);

% 调用fminunc函数
[x, fval] = fminunc(objFun, x0, options);

% 显示最优解和目标函数值
disp(['最优解: ', num2str(x)]);
disp(['目标函数值: ', num2str(fval)]);
