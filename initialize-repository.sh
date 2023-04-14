#!/bin/bash -e

# Set the repository name from the first argument
repository_name=$1

# Print a message indicating that the repository is being created
echo -e "\033[32mCreating repository $repository_name ...\033[0m"

# Create the repository directory if it doesn't exist and move into it
mkdir -p $repository_name
cd $repository_name

# Initialize a new Git repository in the current directory
git init

# Print a message indicating that the repository was successfully created
echo -e "\033[32mRepository $repository_name successfully created!\033[0m"
