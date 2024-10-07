function [bestSol, bestCost] = simulatedAnnealing(costFunc, initialSol, temp, minTemp, coolingRate)
    currentSol = initialSol;
    currentCost = costFunc(currentSol);
    bestSol = currentSol;
    bestCost = currentCost;
    while temp > minTemp
        newSol = neighbor(currentSol); % 邻域函数需要根据具体问题定义
        newCost = costFunc(newSol);
        costDiff = newCost - currentCost;
        if (costDiff < 0) || (exp(-costDiff / temp) > rand())
            currentSol = newSol;
            currentCost = newCost;
            if currentCost < bestCost
                bestSol = currentSol;
                bestCost = currentCost;
            end
        end
        temp = temp * coolingRate; % 冷却过程
    end
end