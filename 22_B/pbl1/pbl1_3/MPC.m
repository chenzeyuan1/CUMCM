N = 9;  % 无人机数量（不包括中心无人机）
dt = 0.1;  % 时间步长
prediction_horizon = 20;  % 预测时域长度
lambda_r = 0.1;  % 径向控制输入权重
lambda_theta = 0.1;  % 角度控制输入权重
max_iter = 100;  % 最大迭代次数

% 初始位置（极坐标）
positions = [
    100, 0;
     98, 40.10;
    112, 80.21;
    105, 119.75;
     98, 159.86;
    112, 199.96;
    105, 240.07;
     98, 280.17;
    112, 320.28
];

% 理想位置
ideal_theta = linspace(0, 320, N);  % 理想角度位置
ideal_radius = 100;  % 理想半径

% 系统模型
A = eye(2);
B = eye(2) * dt;

% 目标函数
objective = @(u, r, theta, r_ideal, theta_ideal) ...
    sum(arrayfun(@(k) (r + u(2*k-1) * dt - r_ideal)^2 + ...
    (theta + u(2*k) * dt - theta_ideal)^2 + ...
    lambda_r * u(2*k-1)^2 + lambda_theta * u(2*k)^2, 1:prediction_horizon));

% 约束条件
lb = -ones(2 * prediction_horizon, 1);
ub = ones(2 * prediction_horizon, 1);

% MPC控制
for t = 1:max_iter
    for i = 1:N
        u0 = zeros(2 * prediction_horizon, 1);
        options = optimoptions('fmincon', 'Display', 'off');
        u_opt = fmincon(@(u) objective(u, positions(i, 1), positions(i, 2), ...
            ideal_radius, ideal_theta(i)), u0, [], [], [], [], lb, ub, [], options);

        % 应用控制输入
        positions(i, 1) = positions(i, 1) + u_opt(1) * dt;
        positions(i, 2) = positions(i, 2) + u_opt(2) * dt;
    end

    % 打印当前时刻的位置
    fprintf('时间步 %d，位置：\n', t);
    disp(positions);
end

% 输出最终位置
disp('最终位置：');
disp(positions);
hold on
r = positions(:,1);
theta = positions(:,2)
axis equal
x0 = r.*cosd(theta);
y0 = r.*sind(theta);
scatter(x0,y0,'filled');

R = 100;
theta_ideal = 0:2*pi/9:9;
x_ideal = R*cos(theta_ideal);
y_ideal = R*sin(theta_ideal);
plot(x_ideal,y_ideal)

xlabel("x");
ylabel("y")
legend(["实际点","理想点"])


SS(positions(:,1),positions(:,2))