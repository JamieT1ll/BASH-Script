#!/bin/bash

log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

echo "Enter the name of the repository you want to remove a file from: "
read rName

# Check if the main branch exists
if [ -d "$rName/mainBranch" ]; then
    cd "$rName/mainBranch"
    echo "Files in the repository:"
    ls
    echo -e "\n"

    echo "Enter the name of the file you want to remove from the repository: "
    read fName

    if [ -e "$fName" ]; then
        cp "$fName" "../backup/$fName"
        rm "$fName"
        if [ $? -eq 0 ]; then
            echo "'$fName' has been removed from the repository."
            log "Removed file '$fName' from the repository"
        else
            echo "Failed to remove '$fName' from the repository."
        fi
    else
        echo "File '$fName' does not exist in the repository."
    fi

    cd ~/assignment1  # Change back to the original directory
else
    echo "Invalid repository name. Please check if the repository exists."
fi
