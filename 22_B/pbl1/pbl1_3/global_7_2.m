% 初始化 r 和 theta 数组
t_r = [100 98 112 105 98 112 105 98 112];
t_theta = [0 40.10 80.21 119.75 159.86 199.96 240.07 280.17 320.28];
r = [100 98 112 105 98 112 105 98 112];
theta = [0 40.10 80.21 119.75 159.86 199.96 240.07 280.17 320.28];
% 初始化 d 数组为与 r 同样大小的零数组
d = zeros(size(r));
R = 100;
% 初始化 i 为 3，开始循环直到 1000
i = 3;
n = 0;
p = 0;
hold on
while sum_distance(r,theta)>10

    % 计算 n 为 i 对 8 取模后加 2

    % [~,n] = min(each_distance(r,theta))
    [~,m] = max(each_distance(r,theta));
    % 循环遍历 m 从 1 到 8
    % for m = 1:8
    % 如果 m 等于 n，则跳过当前迭代
    if rand(1)>0.6
        n = mod(i, 8) + 2;
    else
        [~,n] = min_distance(r,theta);
    end
    if n==1
        continue
    end


    if rand(1)>0.6
        p = mod(i, 8) + 2;
    else
        [~,p] = second_min(r,theta);
    end
    if p==1
        continue
    end
    if m == p || m==n
        if rand(1)>0.5
            continue
        else
            m = mod(floor(rand(1)*10),8)+1;

        end
    end

    if m==1
        continue;
    end

    % 计算 pbl3_a1 和 pbl3_a3
    % pbl3_a1 = pi / 2 + theta(m) / 2;
    pbl3_a1 = 20*m-110;
    % pbl3_a3 = theta(n) / 2;
    pbl3_a3 = 30*n;
    % 调用 a2a3torhotheta 函数计算 R_m 和 rho_m
    [R_m, rho_m] = a2a3torhotheta((pbl3_a1 - pbl3_a3), pbl3_a3, theta(n),R);
    % 更新 temp_r 和 theta 的值
    r(m) = R_m;
    theta(m) = rho_m;

    % end
    % 使用更新后的 temp_r 和 theta 绘制散点图


    % i 自增
    i = i + 1;
figure
axis equal;
scatter(r .* cos(theta), r .* sin(theta), 'filled');
    if mod(i,1e6) == 0
        sum_distance(r,theta)
        axis equal;
        % scatter(r .* cos(theta), r .* sin(theta), 'filled');
    end

end

% axis equal;
% scatter(r .* cos(theta), r .* sin(theta), 'filled');
% scatter(t_r.*cos(t_theta),t_r.*sin(t_theta))

% angles = linspace(0, 2*pi, 10); % 生成10个点的角度，包括起点和终点
% % angles = angles(1:end-1); % 移除终点，以避免与起点重合
% x1 = R * cos(angles);
% y1 = R * sin(angles);
% plot(x1,y1)
hold off


