import numpy as np
from scipy.optimize import minimize
import random
# 参数设置
import matplotlib.pyplot as plt
import numpy as np
N = 15  # 无人机数量
dt = 0.1  # 时间步长
prediction_horizon = 30  # 预测时域长度
lambda_u = 0.1  # 控制输入权重

def simulate():
    # 初始位置
    # positions = np.array([
    #     [1.42, 199.33],
    #     [-22.12, 151.89],
    #     [28.87, 149.75],
    #     [-53.16, 101.12],
    #     [0.0, 100.0],
    #     [50.0, 100.0],
    #     [-74.29, 49.65],
    #     [-28.19, 50.79],
    #     [26.94, 51.24],
    #     [73.92, 49.44],
    #     [-98.25, -0.59],
    #     [-50.68, -1.81],
    #     [0.77, 2.01],
    #     [47.98, 1.21],
    #     [102.14, -0.89]
    # ])
    positions = np.array([
        [0.0, 200*(0.2*random.random()+1)],
        [-25.0*(0.2*random.random()+1), 150*(0.2*random.random()+1)],
        [25.0*(0.2*random.random()+1), 150*(0.2*random.random()+1)],
        [-50.0*(0.2*random.random()+1), 100*(0.2*random.random()+1)],
        [0.0, 100*(0.2*random.random()+1)],
        [50.0*(0.2*random.random()+1), 100*(0.2*random.random()+1)],
        [-75.0*(0.2*random.random()+1), 50*(0.2*random.random()+1)],
        [-25.0*(0.2*random.random()+1), 50*(0.2*random.random()+1)],
        [25.0*(0.2*random.random()+1), 50*(0.2*random.random()+1)],
        [75.0*(0.2*random.random()+1), 50*(0.2*random.random()+1)],
        [-100.0*(0.2*random.random()+1), 0*(0.2*random.random()+1)],
        [-50.0*(0.2*random.random()+1), 0],
        [0.0, 0],
        [50.0*(0.2*random.random()+1), 0],
        [100.0*(0.2*random.random()+1), 0]
    ])
    # 理想位置（锥形编队）
    ideal_positions = np.array([
        [0.0, 200],
        [-25.0, 150],
        [25.0, 150],
        [-50.0, 100],
        [0.0, 100],
        [50.0, 100],
        [-75.0, 50],
        [-25.0, 50],
        [25.0, 50],
        [75.0, 50],
        [-100.0, 0],
        [-50.0, 0],
        [0.0, 0],
        [50.0, 0],
        [100.0, 0]
    ])

    # 系统模型
    A = np.eye(2)
    B = np.eye(2) * dt

    # 目标函数
    def objective(u, x, y, x_ideal, y_ideal, lambda_u):
        cost = 0
        for k in range(prediction_horizon):
            x = x + u[2*k] * dt
            y = y + u[2*k+1] * dt
            cost += (x - x_ideal)**2 + (y - y_ideal)**2 + lambda_u * (u[2*k]**2 + u[2*k+1]**2)
        return cost

    # 约束条件
    bounds = [(-1, 1)] * (2 * prediction_horizon)

    max_iter = 30
    # MPC控制
    for t in range(max_iter):
        for i in range(N):
            u0 = np.zeros(2 * prediction_horizon)
            res = minimize(objective, u0, args=(positions[i, 0], positions[i, 1], ideal_positions[i, 0], ideal_positions[i, 1], lambda_u), bounds=bounds)
            u_opt = res.x
            
            # 应用控制输入
            positions[i, 0] += u_opt[0] * dt
            positions[i, 1] += u_opt[1] * dt
        
        # 打印当前时刻的位置
        print(f"时间步 {t}，位置：{positions}")

    # 输出最终位置
    print("最终位置：", positions)

    #import numpy as np

    # 假设 ideal_positions 已经定义
    # ideal_positions = ...

    # 初始化误差列表
    errors = []

    for t in range(max_iter):
        # 应用控制输入并更新位置
        for i in range(len(positions)):
            positions[i, 0] += u_opt[0] * dt
            positions[i, 1] += u_opt[1] * dt
        
        # 计算当前时间步的误差
        current_errors = np.linalg.norm(positions - ideal_positions, axis=1)
        average_error_this_step = np.mean(current_errors)
        errors.append(average_error_this_step)
        
        # 打印当前时刻的位置和平均误差
        print(f"时间步 {t}，位置：{positions}, 平均误差：{average_error_this_step}")

    # 计算整个模拟过程的最大误差、平均误差和误差标准差
    max_error = max(errors)
    average_error = sum(errors) / len(errors)
    std_dev_error = np.std(errors)

    # 输出最终位置和误差分析结果
    print("最终位置：", positions)
    print(f"最大误差: {max_error}")
    print(f"平均误差: {average_error}")
    print(f"误差标准差: {std_dev_error}")

    
    

    # 绘制残差图
    time_steps = list(range(max_iter))
    # plt.scatter(time_steps, errors)
    # plt.title('Residual analysis diagram')
    # plt.xlabel('time_steps')
    # plt.ylabel('average error')
    # plt.show()

    # 计算样本相关系数
    # 假设 ideal_positions 和 positions 都是numpy数组
    # 并且它们的形状是 [时间步数, 无人机数, 坐标维度]
    # 我们需要将它们重塑为 [时间步数*无人机数, 坐标维度] 来计算相关系数
    ideal_positions_flat = ideal_positions.reshape(-1, ideal_positions.shape[-1])
    positions_flat = positions.reshape(-1, positions.shape[-1])
    corr_coeff = np.corrcoef(ideal_positions_flat.T, positions_flat.T)[:2, 2:]
    print("样本相关系数:\n", corr_coeff)
    return errors, max_error, average_error, std_dev_error, corr_coeff
    # import matplotlib.pyplot as plt

    # 绘制残差直方图
    # plt.hist(errors, bins='auto')  # 'auto'让matplotlib自动决定最佳的箱数
    # plt.title('残差直方图')
    # plt.xlabel('平均误差')
    # plt.ylabel('频率')
    # plt.show()
all_errors = []  # 初始化一个空列表来收集所有模拟的误差

corr_coeffs = []  # 用于存储所有模拟的相关系数
for i in range(10):
    print(f"第 {i+1} 次模拟：")
    # errors, max_error, average_error, std_dev_error, corr_coeff = simulate()
    # corr_coeffs.append(corr_coeff)  # 添加当前模拟的相关系数
    errors, max_error, average_error, std_dev_error, corr_coeff = simulate()
    all_errors.extend(errors)  # 将当前模拟的误差添加到列表中

    # 绘制残差直方图
    # plt.hist(errors, bins='auto', alpha=0.75)  # 'auto'让matplotlib自动决定最佳的箱数
    # plt.title(f'第 {i+1} 次模拟的残差直方图')
    # plt.xlabel('平均误差')
    # plt.ylabel('频率')
    # plt.show()

# 绘制误差分析曲线
plt.figure(figsize=(10, 6))  # 设置图形的大小
plt.plot(all_errors, label='误差')  # 绘制误差曲线
plt.title('总体误差分析曲线')
plt.xlabel('模拟次数')
plt.ylabel('误差')
plt.legend()
plt.show()
# 计算所有模拟的平均相关系数
average_corr_coeff = np.mean(corr_coeffs, axis=0)
print("所有模拟的平均相关系数:\n", average_corr_coeff)

# 绘制残差直方图
plt.hist(all_errors, bins='auto')  # 'auto'让matplotlib自动决定最佳的箱数
plt.title('残差直方图')
plt.xlabel('平均误差')
plt.ylabel('频率')
plt.show()