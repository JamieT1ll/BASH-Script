#!/bin/bash

#Menu For The Program
PS3='Please enter your choice: '
options=("1. Create File" "2. Edit File" "3. Delete File" "4. Check Logs" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "Create File"
            ;;
        "Option 2")
            echo "Edit File"
            ;;
        "Option 3")
            echo "Delete File"
            ;;
        "Option 4")
            echo "Logs"
            ;;
        "Exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done