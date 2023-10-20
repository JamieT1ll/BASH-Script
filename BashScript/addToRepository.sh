#!/bin/bash

log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

echo "Do you want to create a new file or move an existing file?"
PS3='Select an action: '
options=("1. Create a New File" "2. Move an Existing File")
select action in "${options[@]}"
do
    case $action in
        "1")
            # Create a New File
            echo "What would you like to name your file?: "
            read fName
            echo "What Repository do you want to move the file into: "
            read rName

            if [ -e "$rName/branches" ]; then
                touch "$rName/branches/$fName"
                if [ $? -eq 0 ]; then
                    echo "'$fName' created in '$rName/branches/'"
                    log "Created file '$fName' in '$rName/branches/'"
                    echo "File added to the Repository"
                else
                    echo "Failed to create '$fName' in the folder"
                fi
            else
                echo "Invalid Repository specified. Please check if the Repository exists."
            fi
            ;;
        
        "2")
            # Move an Existing File
            echo "Enter the name of the file you would like to move:"
            read fName
            echo "Enter the name of the Repository you want to move it to: "
            read rName

            if [ -e "$fName" ] && [ -d "$rName/branches" ]; then
                mv "$fName" "$rName/branches/"
                if [ $? -eq 0 ]; then
                    echo "'$fName' moved to '$rName/branches/'"
                    log_action "Moved file '$fName' to '$rName/branches/'"
                    echo "File added to the Repository"
                else
                    echo "Failed to move '$fName' to folder"
                fi
            else
                echo "Error, file or Repository not found."
            fi
            ;;
        *)
            echo "Invalid option: please enter a number from the menu for your choice."
            ;;
    esac
    break
done
