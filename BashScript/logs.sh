#!/bin/bash

PS3='What would you like to do with the logs?: '
options=("1. View Logs" "2. Revert Changes" "3. Clear Logs" "4. Clear Backups" "e) Exit")
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
            read backupName
            if [ -e "backup/$bakcupName" ]; then
                cp "backup/$backupName" .  # Restore the backup file
                echo "Changes reverted for $backupName."
            else
                echo "Backup file for $fileName not found. No changes reverted."
            fi
            ;;

        "3")
            # Clears Logs
            echo are you sure you would like to clear out all logs?
            echo "Clearing Logs..."
            rm -f logs/*  # Remove all files in the 'logs' directory
            echo "Logs cleared."
            ;;

        "4")
           

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
