#!/bin/bash

log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

echo "Enter the name of the Repository you want to remove a file from: "
read rName

# Check if the Repository directory exists
if [ -d "$rName/branches" ]; then
    cd "$rName/branches"
    echo "Files in the repository:"
    ls
    echo -e "\n"

    echo "Enter the name of the file you want to remove from the Repository: "
    read fName

    if [ -e "$fName" ]; then
        cp "$fName" "../backup/$fName"
        rm "$fName"
        if [ $? -eq 0 ]; then
            echo "'$fName' has been removed from the Repository."
            log "Removed file '$fName' from the Repository"
        else
            echo "Failed to remove '$fName' from the Repository."
        fi
    else
        echo "File '$fName' does not exist in
