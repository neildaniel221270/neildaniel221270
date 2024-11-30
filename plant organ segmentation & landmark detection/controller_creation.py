import gymnasium as gym
from simple_pid import PID
from math import atan2, degrees, pi
from ot2_gym_wrapper import OT2Env

# Create the OT-2 environment
env = OT2Env(1)

# Create PID controllers for each axis
pid_controller_x = PID(Kp=6, Ki=0.8, Kd=4)
pid_controller_y = PID(Kp=6, Ki=0.8, Kd=4)
pid_controller_z = PID(Kp=6, Ki=0.8, Kd=4)

num_episodes = 5

for episodes in range(num_episodes):
    # Reset the environment
    obs, info = env.reset()
    print("Reset observation:",obs)
    print("Lenght of observation:", len(obs))

    done = False
    step = 0

    # Setpoints for each axis
    pid_controller_x.setpoint = 0
    pid_controller_y.setpoint = 0
    pid_controller_z.setpoint = 0

    # Extract the target position from the observation
    x_target, y_target, z_target = obs[-3:]

    pid_controller_x.setpoint = x_target
    pid_controller_y.setpoint = y_target
    pid_controller_z.setpoint = z_target

    while not done:
        print(f'Step observation: {obs}')
        # Compute the current error for each axis
        error_x = obs[0]- x_target
        error_y = obs[1]- y_target
        error_z = obs[2]- z_target
        print(f'Error: {error_x}, {error_y}, {error_z}')
        # Compute action for each axis using the PID controllers
        action_x = pid_controller_x(obs[0])
        action_y = pid_controller_y(obs[1])
        action_z = pid_controller_z(obs[2])

        # Combine actions for each axis
        action = [action_x, action_y, action_z]
        print(f'Action: {action}')
        # Step the environment with the computed action
        obs, reward, terminated, truncated, info = env.step(action)
        # print(f'Step observation: {obs}')
        done = terminated or truncated

        # print(f"Episode: {episode + 1}, Step: {step + 1}, Action: {action}, Reward: {reward}")

        step += 1
        if done:
            print(f"Episode finished after {step} steps. Info: {info}")
            break       
