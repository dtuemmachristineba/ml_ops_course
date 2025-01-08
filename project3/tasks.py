import os
import invoke
from invoke import Context, task

# first install invoke
# pip install invoke
# then you can execute the tasks
@task
def preprocess_data(c):
	c.run('python data.py')

@task
def requirements(c):
	c.run('pip install -r requirements.txt')

@task
def train(c):
	c.run('python train.py')

# To run the tasks, use the following commands in the terminal:
# invoke preprocess-data  # runs the data.py file
# invoke requirements     # installs all requirements in the requirements.txt file
# invoke train            # runs the train.py file
# or get a list of all tasks
# invoke --list