#!/bin/bash
PS3='Would you like to create a file or a repository?'
option=("1. File" "2. Repository" "3. Exit")
select opt in "${option[@]}"
do
    case $opt in
        "1")
         #File Creation
            echo "Where would you like to create your file?"
            ./createFile.sh
            ;;
        "2")
           #Enters Module For Edit File Function
            echo "Where would you like to create your directory?"
            
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