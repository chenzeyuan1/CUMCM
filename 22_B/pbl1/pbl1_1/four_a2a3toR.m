function [Rm,theta_m] = four_a2a3toR(rp,fp,rn,fn,a2p,a2n,m)

    function F = myFunc(x)
    
    % x(1) 对应 fm, x(2) 对应 rm
    fm = x(1);
    rm = x(2);
    
    % 定义方程组
    F(1) = rp*sin(fp-fm+a2p) - rm*sin(a2p);
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
Rm = solution(2);
theta_m = solution(1);
end