#!/bin/bash

echo "Enter the name of the file to move: "
        read fName
        echo "Enter the name of the repository you want to add to: "
        read rName

        if [ -e "$fName" ] && [ -d "$rName" ]; then
            mv "$fName" "$rName/mainBranch/"
            if [ $? -eq 0 ]; then
                echo "'$fName' moved to '$rName/mainBranch/'"
                date | tee -a "$rName/mainBranch/logFile/logfile.txt"
                echo "File added to main branch"
            else
                echo "Failed to move '$fName' to folder"
            fi
        else
            echo "Invalid file or directory specified. Please check if the file and repository exist."
        fi
