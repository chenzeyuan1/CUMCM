function ran = sprt(num, p0)

    % 参数设置
    p1 = 0.15;  % 拒绝质量水平
    alpha = 0.05;  % 第一类错误概率
    beta = 0.10;  % 第二类错误概率

    % 计算决策边界
    lnA = log((1 - beta) / alpha);
    lnB = log(beta / (1 - alpha));

    % 模拟实际检测过程
    num_batches = num;
    
    % 生成随机次品率
    true_ps = p0 + 0.008 * randn(1, num_batches);
    true_ps = max(0, min(1, true_ps));  % 确保次品率在[0,1]范围内

    % 初始化决策和样本数向量
    batch_decisions = cell(1, num_batches);
    batch_sample_sizes = zeros(1, num_batches);

    % 使用parfor进行并行计算
    parfor i = 1:num_batches
        [decision, n] = sprt_simulation(p0, p1, lnA, lnB, true_ps(i));
        batch_decisions{i} = decision;
        batch_sample_sizes(i) = n;
    end

    % 统计结果
    reject_rate = sum(strcmp(batch_decisions, 'reject')) / num_batches;
    ran = num * reject_rate;

end