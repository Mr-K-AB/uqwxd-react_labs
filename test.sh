#!/bin/bash

# Define the initial and final dates
start_date="20210425"
end_date="20230923"

# Specify the range for the random number
x=0
y=7

# Number of repetitions
repetitions=$((RANDOM % (y - x + 1) + x))  # Set this value as needed

# Create a new file at the beginning (if it doesn't already exist)
touch new_file3.txt

while [ "$start_date" -le "$end_date" ]
do
    # Change the system date
    date -s "$start_date"

    # Generate a random number between x and y
    repetitions=$((RANDOM % (y - x + 1) + x))

    for ((i=0; i<repetitions; i++))
    do
        # Modify the file (you can use any text or command to modify the file)
        echo "Modification for $start_date, Repetition $i" >> new_file.txt

        # Add and commit changes to the Git repository
        git add .
        git commit -m "Commit message for $start_date"
    done

    # Push the changes to the remote repository (if needed)
    git push

    # Advance the date by one day
    start_date=$(date -d "$start_date + 1 day" +%Y%m%d)
done

# git push
