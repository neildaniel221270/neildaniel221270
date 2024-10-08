import gymnasium as gym
import os
import tensorflow as tf
from stable_baselines3 import PPO
import numpy as np
from ot2_gym_wrapper2 import OT2Env

os.chdir(os.path.dirname(os.path.realpath(__file__)))

# Create the Gym environment
env = OT2Env(render=True, max_steps=1000)

# Load the model
model = PPO.load("./wandbi models/model_3.zip")

# Evaluate the model over a certain number of episodes
num_episodes = 10
 
for episode in range(num_episodes):
    obs, _ = env.reset()  # Reset the environment and get the initial observation
    done = False
    step = 0  # Initialize the step counter
   
    while not done:
        print(obs)
        action, _states = model.predict(obs, deterministic=True)  # deterministic=True for evaluation
        obs, reward, terminated, truncated, info = env.step(action)  # Execute the action in the environment
       
        # Calculate the Euclidean distance between the robot's current position and the goal
        distance_to_goal = np.linalg.norm(obs[:3] - obs[3:])
       
        # Print step information
        print(f"Episode {episode + 1}, Step {step + 1}:")
        print(f"Action: {action}")
        print(f"Reward: {reward}")
        print(f"Distance to Goal: {distance_to_goal}")
       
        # Check if the episode is terminated or truncated
        if terminated:
            print("Episode Terminated")
        elif truncated:
            print("Episode Truncated (Maximum Steps Reached)")
       
        # Update the done flag and step counter
        done = terminated or truncated
        step += 1
       
    print(f"Episode {episode + 1} completed in {step} steps\n")

# Close the environment after testing
env.close()