#!/bin/bash

PS3='What would you like to do with the logs?: '
options=("1. View Logs" "2. Revert Changes" "3. Clear Logs" "e) Exit")
select opt in "${options[@]}"
do
    case $opt in
        "1")
            # Displays Logs
            echo "Opening Logs..."
            ./create.sh
            ;;

        "2")
            # Reverts Changes
            echo "Enter the name of the file you want to revert changes for: "
            read fileName
            if [ -e "backup/$fileName" ]; then
                cp "$fileName" "backup/$fileName.$(date +'%Y%m%d%H%M%S')"  # Create a new backup file
                cp "backup/$fileName" .  # Restore the backup file
                echo "Changes reverted for $fileName."
            else
                echo "Backup file for $fileName not found. No changes reverted."
            fi
            ;;

         "3")
          # Clears Logs
          echo "Are you sure you want to clear all of the logs? Y/N)"
          read confirmation
          if [ "$confirmation" = "Y" ]; then
           echo "Clearing Logs..."
           rm -f logs/*  # Remove all files in the 'logs' directory
           echo "Logs cleared."
    else
        echo "Logs were not cleared."
    fi
    ;;

        "e")
            echo "Exiting the menu."
            exit
            ;;

        # Input validation for incorrect inputs
        *)
            echo "Invalid option: $REPLY, please enter a number from the menu for your choice."
            ;;
    esac
done