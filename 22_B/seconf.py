import numpy as np
from scipy.optimize import minimize

# 参数设置
N = 15  # 无人机数量
dt = 0.1  # 时间步长
prediction_horizon = 30  # 预测时域长度
lambda_u = 0.1  # 控制输入权重

# 初始位置
positions = np.array([
    [1.42, 199.33],
    [-22.12, 151.89],
    [28.87, 149.75],
    [-53.16, 101.12],
    [0.0, 100.0],
    [50.0, 100.0],
    [-74.29, 49.65],
    [-28.19, 50.79],
    [26.94, 51.24],
    [73.92, 49.44],
    [-98.25, -0.59],
    [-50.68, -1.81],
    [0.77, 2.01],
    [47.98, 1.21],
    [102.14, -0.89]
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

# MPC控制
for t in range(15):
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