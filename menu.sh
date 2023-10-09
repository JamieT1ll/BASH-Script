#!/bin/bash

#Menu For The Program
PS3='Please enter the number of your choice: '
options=("1. Create File" "2. Edit File" "3. Delete File" "4. Check Logs" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "1")
         #Enters Module For Create File Function
            echo "Create File"
            ./create.sh
            ;;
        "2")
           #Enters Module For Edit File Function
            echo "Edit File"
            ./edit.sh
            ;;
        "3")
            #Enters module for delete File Function
            echo "Delete File"
            ./delete.sh
            ;;
        "4")
            #Enters Module for Logs Function
         echo "Logs"
          ./logs.sh
            ;;
        "Exit")
            break
            ;;
        *) 
        echo "invalid option $REPLY";;
    esac
done