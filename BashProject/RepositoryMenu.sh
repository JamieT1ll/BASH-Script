#!/bin/bash

#Menu For The Program when selected Edit Repository
PS3='Please enter the number of your choice: '
option=("1. Create Repository" "2. Edit File" "3. Delete File" "Exit")
select opt in "${option[@]}"
do
    case $opt in
        "1")
         #Enters Module For Create File Function
            echo "Create Repository"
            ./create.sh
            ;;
        "2")
           #Enters Module For Edit File Function
            echo "Edit Repository"
            ./edit.sh
            ;;
        "3")
            #Enters module for delete File Function
            echo "Delete Repository"
            ./delete.sh
            ;;

        "4")
           echo "Commit Repository"
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