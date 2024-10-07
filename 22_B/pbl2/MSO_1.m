
% 参数设置
num_drones = 4; % 无人机数量
time_step = 0.1; % 时间步长
total_time = 10; % 总时间
num_steps = total_time / time_step; % 总步数

% 无人机初始位置和速度（假设二维平面）
positions = [0, 0; 50, 0; 100, 0; 150, 0]; % 初始位置
velocities = zeros(num_drones, 2); % 初始速度

% 目标位置（锥形编队）
target_positions = [0, 0; 50, 50; 100, 100; 150, 150];

% MPC控制器参数
Q = eye(2); % 状态权重
R = eye(2); % 控制权重
horizon = 10; % 预测时域

% 模拟过程
for step = 1:num_steps
    for i = 1:num_drones
        % 计算当前误差
        error = target_positions(i, :) - positions(i, :);

        % 构建优化问题
        H = blkdiag(kron(eye(horizon), Q), kron(eye(horizon), R));
        f = -[kron(ones(horizon, 1), Q) * repmat(error', horizon, 1); 
            zeros(horizon * 2, 1)];
        
        % 约束条件
        Aeq = [eye(horizon * 2), -kron(eye(horizon), eye(2))];
        beq = [zeros(horizon * 2, 1); velocities(i, :)'];

        % 求解优化问题
        options = optimoptions('quadprog', 'Display', 'off');
        u = quadprog(H, f, [], [], Aeq, beq, [], [], [], options);

        % 获取当前控制输入
        control_input = u(1:2);

        % 更新无人机位置和速度
        velocities(i, :) = velocities(i, :) + control_input' * time_step;
        positions(i, :) = positions(i, :) + velocities(i, :) * time_step;
    end

    % 绘制无人机位置
    clf;
    hold on;
    plot(target_positions(:, 1), target_positions(:, 2), 'rx');
    plot(positions(:, 1), positions(:, 2), 'bo');
    legend('目标位置', '当前位置');
    xlim([-50, 200]);
    ylim([-50, 200]);
    drawnow;
end

