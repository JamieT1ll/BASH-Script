#!/bin/bash
echo "What is the directory of the file?"


echo "What is the name of the file?"

PS3='How do you want to edit the file?'
option=("1. Edit Contents" "2. Delete" "3. Exit")
select opt in "${option[@]}"
do
    case $opt in
        "1")
         #Edit File
            echo "Create File"
            ./create.sh
            ;;
        "2")
           #Delete File
            echo "Edit File"
            ;;

        "Exit")
            #Ends Program.
            break
            ;;

        #Input validation for incorrect inputs
        *) 
        echo "invalid option: $REPLY, please enter a Number from the menu for your choice.";;
    esac
done