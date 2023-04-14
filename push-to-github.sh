#!/bin/bash -e

# Get the name of the repository and the remote URL from command line arguments
repository_name=$1
git_remote=$2

# Change into the directory of the repository
cd $repository_name

# Add the remote URL as origin to the local repository
git remote add origin $git_remote

# Push the local master branch to the remote repository
git push -u origin master
