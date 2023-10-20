#!/bin/bash

log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

clear

echo "What repository would you like to merge a branch in?"
echo "Choose from the options below:"
echo -e "\n"

# List the available repositories (directories) in the current location
ls -d */ | sed 's;/$;;'

read rChoice

# Navigate to the chosen repository's mainBranch
cd "$rChoice/branches/mainBranch"
pwd
echo -e "\n"
ls
echo -e "\n"

echo "What branch would you like to merge from?"

# List the available branches within the "branches" directory of the chosen repository
ls -d */ | sed 's;/$;;'

read bChoice
cd "$bChoice"

ls

echo -e "\n"
echo "What file would you like to merge with main?: "
read fChoice

if [ -e "../$fChoice" ]; then
    # Use diff to compare the two files
    if diff "$fChoice" "../$fChoice"; then
        echo "No differences found. The files are identical."
    else
        echo "Differences found between the files:"
        # Display the differences using diff
        diff "$fChoice" "../$fChoice"
        echo -e "\n"
        echo "Do you want to merge the files? (y/n): "
        read mergeChoice
        if [ "$mergeChoice" = "y" ] || [ "$mergeChoice" = "Y" ]; then
            # Merge the files by overwriting the destination
            cp "$fChoice" "../$fChoice"
            echo "Files merged successfully."
            rm "$fChoice"
            pwd
        else
            echo "Files not merged."
        fi
    fi
else
    # If the file doesn't exist in the destination, simply move it
    mv "$fChoice" "../"
    ls
fi
