#!/bin/bash -e

# Get the repository name and the number of commits to create from command line arguments
repository_name=$1
commits_number=$2

# Set a default commit message
commit_message="Yet another commit"

# Change the current directory to the repository
cd $repository_name

# Loop through the specified number of days to create commits
for ((day_counter=1; day_counter<=commits_number; day_counter++))
do
    # Calculate the date of the commit
    delta="-"$day_counter"d"
    date=$(date -v$delta +%Y-%m-%d)

    # Determine the number of commits to make for this day (random between 0 and 4, with some exceptions)
    num=$(( RANDOM % 5 ))
    if [ $num -eq 0 ]; then
      num=0
    else
      num=$(( (RANDOM % 8 + 1) % num ))
    fi

    # Loop through the number of commits to make for this day
    for ((n=0; n<num; n++)); do 
        # Determine a random file to modify (random between 0 and 9, with some exceptions)
        rand=$(( RANDOM % 10 ))
        if [ $rand -eq 0 ]; then
            rand=$(( RANDOM % 8 ))
        elif [ $rand -eq 1 ]; then
            rand=$(( RANDOM % 4 ))
        elif [ $rand -eq 8 ]; then
            rand=25
        elif [ $rand -eq 9 ]; then
            rand=43
        fi

        # Add and commit changes to the random file, with the specified commit message and date
        echo "$date:$commit_message" >> history.txt
        git add . -A
        git commit -m "$commit_message"
        git commit --amend --no-edit --date="$date"
    done
done
