#!/bin/bash

# Clear terminal and show GitHeat ASCII art
clear
echo "
   _____ _ _   _    _            _   
  / ____(_) | | |  | |          | |  
 | |  __ _| |_| |__| | ___  __ _| |_ 
 | | |_ | | __|  __  |/ _ \/ _\ | __|
 | |__| | | |_| |  | |  __/ (_| | |_ 
  \_____|_|\__|_|  |_|\___|\__,_|\__|
                      Version 1.0.0
"

# Text styles
BOLD=$(tput bold)
GREEN=$(tput setaf 6)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Prompt user for input
echo "${BOLD}Enter the remote URL of the GitHub repository:${RESET}"
read git_remote

echo "${BOLD}Enter the number of days to go back from today:${RESET}"
read days_backwards

echo "${BOLD}Enter the name of the subdirectory to create the repository in:${RESET}"
read repository_name

# Initialize repository
echo "${BOLD}[1/3] Initializing repository...${RESET}"
bash initialize-repository.sh $repository_name 1>/dev/null
if [ $? -ne 0 ]; then
    echo "${RED}⨯ Initializing repository failed!${RESET}"
    exit 1
else
    echo "${GREEN}✓ Repository successfully initialized!${RESET}"
fi

# Create commits
echo "${BOLD}[2/3] Creating commits (this can take a few seconds)...${RESET}"
bash create-commits.sh $repository_name $days_backwards 1>/dev/null
if [ $? -ne 0 ]; then
    echo "${RED}⨯ Creating commits failed!${RESET}"
    exit 1
else
    echo "${GREEN}✓ Commits successfully created!${RESET}"
fi

# Push repository to remote
echo "${BOLD}[3/3] Pushing repository to remote...${RESET}"
bash push-to-github.sh $repository_name $git_remote 1>/dev/null
if [ $? -ne 0 ]; then
    echo "${RED}⨯ Pushing repository to remote failed!${RESET}"
    exit 1
else
    echo "${GREEN}✓ Repository successfully pushed to remote!${RESET}"
fi
