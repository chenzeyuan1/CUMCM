function [xm, fv] = PSO (fitness, N, c1, c2, w, M, D)
% 给定初始化条件
% c1学习因子1
% c2学习因子2,自身位置最小
% c3学习因子3,全局最小
% w 慣性权重
% M最大迭代次数
% D搜索空间维数
% N 初始化群体个体数目
% 初始化种群的个体（可以在这里限定位置和速度的范围)
r = [100 98 112 105 98 112 105 98 112];
theta = [0 40.10 80.21 119.75 159.86 199.96 240.07 280.17 320.28];
x = r.*cos(theta);
y = r.*sin(theta);
world_g = sum_distance(r,theta);
format long;
for i=1:N
    for j=1:D
        if j==1
            xy(i,j) = r(i)*cos(theta(i));
        else
            xy(i,j) = r(i)*sin(theta(i));
        end 
        % if j==1
        %     xy(i,j) = r(i);
        % else
        %     xy(i,j) = theta(i);
        % end
        
        v (i, j) =randn;
        % 随机初始化位置
        % 随机初始化速度
    end
end
%先计算各个粒子的适应度，并初始化 P 和 Pg
for i=1:N
    each_p(i) =fitness(xy(i,:));
    xy_last(i,:) =xy(i,:);
end
global_p=xy(N, :);
% Pg为全局最优
for i=1: (N-1)
    if fitness (xy(i,:))< fitness (global_p)
        global_p=xy(i, :);
    end
end

%进入主要循环，按照公式依次选代，直到满足精度要求
for t = 1:M
    for i=1:N
        % 更新速度、位移
        v (i, :) = w*v (i, :) +c1*rand* (xy_last(i,:) -xy(i,:)) +c2* rand* (global_p-xy (i, :)) ;
        xy (i, :) =xy (i, :) +v (i, :) ;
        if fitness (xy (i, :)) < each_p (i)
            each_p(i) = fitness (xy (i, :)) ;
            xy_last (i, :) =xy (i, :);
        end
        if each_p(i)<fitness (global_p)
            global_p=xy_last (i, :) ;
        end
    end
    Pbest (t) = fitness (global_p) ;
end
% 最后给出计算结果
% disp('目标函数取最小值时的自变量：');
xm=global_p';
% disp('目标函数的最小值为：');
fv=fitness (global_p);