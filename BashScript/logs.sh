#!/bin/bash

PS3='What would you like to do with the logs?: '
option=("1. View Logs" "2. Revert Changes" "e) Exit")
select opt in "${option[@]}"
do
    case $opt in
        "1")
         #Displays Logs
            echo "Opening Logs..."
            ./create.sh
            ;;
        "2")
           #Reverts Changes
            echo "What changes would you like to revert?"
            ./edit.sh
            ;;
        
        
        "e")
        echo "Exiting the menu"
        exit
        ;;

        #Input validation for incorrect inputs
        *) 
        echo "invalid option: $REPLY, please enter a Number from the menu for your choice.";;
    esac
done