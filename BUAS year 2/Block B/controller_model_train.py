from stable_baselines3 import PPO
import gymnasium as gym
import time
from ot2_gym_wrapper2 import OT2Env
import os
import wandb
from wandb.integration.sb3 import WandbCallback
import argparse
from clearml import Task


# # Use the appropriate project name and task name (if you are in the first group in Dean's mentor group, use the project name 'Mentor Group D/Group 1')
# # It can also be helpful to include the hyperparameters in the task name
# task = Task.init(project_name='Mentor Group A/Group 1', task_name='Experiment2_Neil')
# #copy these lines exactly as they are
# #setting the base docker image

# #copy these lines exactly as they are
# #setting the base docker image
# task.set_base_docker('deanis/2023y2b-rl:latest')
# #setting the task to run remotely on the default queue
# task.execute_remotely(queue_name="default")

os.chdir(os.path.dirname(os.path.realpath(__file__)))

# Set your WandB API key using environment variables
os.environ['WANDB_API_KEY'] = '###'

# Define command line arguments
parser = argparse.ArgumentParser()
parser.add_argument("--learning_rate", type=float, default=0.0001)
parser.add_argument("--batch_size", type=int, default=64)
parser.add_argument("--n_steps", type=int, default=2048)
parser.add_argument("--n_epochs", type=int, default=10)
args = parser.parse_args()

# Initialize WandB project
run = wandb.init(project="sb6_OT2_train", sync_tensorboard=True)

# Create an instance of OT2Env
env = OT2Env(0)

# Add hyperparameters to the WandB run
wandb.config.update({
    'learning_rate': args.learning_rate,
    'batch_size': args.batch_size,
    'n_steps': args.n_steps,
    'n_epochs': args.n_epochs
})

# Create PPO model with WandB callback
model = PPO('MlpPolicy', env, 
            verbose=1,
            learning_rate=args.learning_rate,
            batch_size=args.batch_size,
            n_steps=args.n_steps,
            n_epochs=args.n_epochs,
            tensorboard_log=f"runs/{run.id}")



# Create WandB callback
wandb_callback = WandbCallback(model_save_freq=10000,
                               model_save_path=f"models/{run.id}",
                               verbose=2)

# Train the model incrementally and save after each iteration
total_timesteps = 100000
for i in range(10):
    # Add the reset_num_timesteps=False argument to prevent resetting the timestep counter
    model.learn(total_timesteps=total_timesteps, callback=wandb_callback, progress_bar=True, reset_num_timesteps=False, tb_log_name=f"runs/{run.id}")
    # Save the model to the models folder with the run id and the current timestep
    model.save(f"models/{run.id}/{total_timesteps * (i + 1)}")