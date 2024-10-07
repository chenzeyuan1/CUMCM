function P_rot = rotatePoint(P, u, theta)
    % P是要旋转的点，格式为[x, y, z]
    % u是旋转轴在xOy平面上的单位向量，格式为[ux, uy, 0]
    % theta是旋转角度，单位为弧度

    % 构造K矩阵
    K = [0, 0, u(2); 0, 0, -u(1); -u(2), u(1), 0];
    
    % 计算旋转矩阵R
    R = eye(3) + sin(theta) * K + (1 - cos(theta)) * (K^2);
    
    % 计算旋转后的点
    P_rot = R * P';
    
    % 转置以匹配输入格式
    P_rot = P_rot';
end