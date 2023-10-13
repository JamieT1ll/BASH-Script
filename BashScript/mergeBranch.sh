#!/bin/bash

clear

    echo "What repository would you like to merge a branch in?"
    echo "choose from the options below"
    echo -e "\n"
    ls -I "*.sh"

    read rChoice
    cd "$rChoice/mainBranch"
    pwd
    echo -e "\n"
    ls
    echo -e "\n"
    echo "what branch would you like to merge from?"

    read bChoice
    cd "$bChoice"

    ls

    echo -e "\n"
    echo "what file would you like to merge with main?: "
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
		rm $fChoice
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
