#!/bin/bash

#This will be the main file ran, and will be the first menu of the program.

PS3='Please enter the number of your choice: '
option=("1. Create Repository" "2. Edit Repository" "3. Delete Repository" "4. Check Logs" "Exit")
select opt in "${option[@]}"
do
    case $opt in
        "1")
         #Enters Module For Create Repository Function
            echo "Create Repository"
            ./create.sh
            ;;
        "2")
           #Enters Module For Edit Repository Function
            echo "Edit File"
            ./edit.sh
            ;;
        "3")
            #Enters module for Check Logs Function
            echo "Delete Repository"
            ./delete.sh
            ;;
        "4")
            #Enters Module for Logs Function
         echo "Logs"
          ./logs.sh
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