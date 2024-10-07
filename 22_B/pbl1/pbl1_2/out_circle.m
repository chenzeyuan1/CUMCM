function r = out_circle(m,n,a2)
R = 100;
Rc2 = R/(2*sin(a2));


function F = myFunc(x)
    
    % x(1) 对应 fm, x(2) 对应 rm
    x_out = x(1);
    y_out = x(2);
    r_out = x(3)
    xm = R*cos(2*pi/9 * (m-1));
    ym = R*sin(2*pi/9 * (m-1));
    xn = R*cos(2*pi/9 * (n-1));
    yn = R*sin(2*pi/9 * (n-1));

    % 定义方程组
    F(1) = (xm - x_out)^2 + (ym - y_out)^2 - (rm2o+)
    F(2) = rn*sin(fn-fm+a2n) - rm*sin(a2n);
 end

% 初始猜测值
initialGuess = [100, 40*m-40]; % 根据问题的具体情况调整

% 使用 fsolve 求解
options = optimoptions('fsolve', 'Display', 'iter'); % 显示迭代过程
[solution, fval, exitflag] = fsolve(@myFunc, initialGuess, options);

% 显示解
disp('解为：');
disp(['fm = ', num2str(solution(1))]);
disp(['rm = ', num2str(solution(2))]);
end