function [decision, n] = sprt_simulation(p0, p1, lnA, lnB, true_p)
    n = 0;
    sum_x = 0;
    while true
        n = n + 1;
        x = rand() < true_p;  % 模拟抽样
        sum_x = sum_x + x;
        lnL = sum_x * log(p1/p0) + (n - sum_x) * log((1 - p1)/(1 - p0));
        
        if lnL >= lnA
            decision = 'reject';
            break;
        elseif lnL <= lnB
            decision = 'accept';
            break;
        end
    end
end
