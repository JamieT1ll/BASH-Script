#!/bin/bash

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
            echo "What repository do you want to move the file into: "
            read rName

            if [ -e "$rName/mainBranch" ]; then
                touch "$rName/mainBranch/$fName"
                if [ $? -eq 0 ]; then
                    echo "'$fName' created in '$rName/mainBranch/'"
                    date | tee -a "$rName/mainBranch/logFile/logfile.txt"
                    echo "File added to main branch"
                else
                    echo "Failed to create '$fName' in the folder"
                fi
            else
                echo "Invalid repository specified. Please check if the repository exists."
            fi
            ;;
        
        "2")
            # Move an Existing File
            echo "Enter the name of the file you would like to move:"
            read fName
            echo "Enter the name of the repository you want to move it to: "
            read rName

            if [ -e "$fName" ] && [ -d "$rName/mainBranch" ]; then
                mv "$fName" "$rName/mainBranch/"
                if [ $? -eq 0 ]; then
                    echo "'$fName' moved to '$rName/mainBranch/'"
                    date | tee -a "$rName/mainBranch/logFile/logfile.txt"
                    echo "File added to main branch"
                else
                    echo "Failed to move '$fName' to folder"
                fi
            else
                echo "Error, file or repository. not found."
            fi
            ;;
        *)
            echo "Invalid option: please enter a number from the menu for your choice."
            ;;
    esac
    break
done
