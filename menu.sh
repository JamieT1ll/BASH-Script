#!/bin/bash

#Menu For The Program
PS3='Please enter the number of your choice: '
options=("1. Create File" "2. Edit File" "3. Delete File" "4. Check Logs" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "1")
            echo "Create File"
            ;;
        "2")
            echo "Edit File"
            ;;
        "3")
            echo "Delete File"
            ;;
        "4) "
        echo "Logs"
            ;;
        "Exit")
            break
            ;;
        *) 
        echo "invalid option $REPLY";;
    esac
done