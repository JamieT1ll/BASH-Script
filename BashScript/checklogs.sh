#!/bin/bash
log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

PS3='What would you like to do with the logs?: '
options=("1. View Logs" "2. Revert Changes" "3. Clear Logs" "4. Clear Backup files" "e) Exit")
select opt in "${options[@]}"
do
    case $opt in
        "1")
        # Displays Logs
        echo "Opening Logs..."
      
        Path="mainBranch/logFile/$logFileName.txt"

        if [ -e "$Path" ]; then
            echo "Contents of $leName:"
            less "$Path"  # Use "less" to view the log file
        else
            echo "Log file '$logFileName' not found in the logFile directory."
        fi
        ;;


        "2")
        # Reverts Changes
         echo "Enter the name of the file you want to revert changes for: "
         read fName
          if [ -e "backup/$fName" ]; then
         if [ -e "$fName" ]; then
            mv "$fName" "temp_$fName"  # Temporarily rename the current file
            cp "backup/$fName" "$fName"  # Copy the backup file as the new current file
            mv "temp_$fName" "backup/$fName"  # Move the current file to the backup folder
            echo "Changes reverted for $fName."
            log "Reverted changes for '$fName'"
         else
            echo "Current file $fName not found. No changes reverted."
         fi
         else
          echo "Backup file for $fName not found. No changes reverted."
          fi
          ;;



"3")
    # Clears Logs
    echo "Are you sure you want to clear all of the logs? Y/N"
    read yn
    if [ "$yn" = "Y" ]; then
        echo "Clearing Logs..."
        rm -rf "mainBranch/logFile"/*  # Remove all files in the logFile directory
        log "Cleared all logs"
        echo "Logs cleared, and the logFile directory has been recreated."
    else
        echo "Logs were not cleared."
    fi
    ;;




   "4")
    # Clear Backup Files
    echo "Are you sure you want to clear all of the backup files? Y/N"
    read yn
    if [ "$yn" = "Y" ]; then
        echo "Clearing Backups..."
        rm -f backup/*  # Remove all files in the 'backup' directory
        log "Cleared all backup files"
        echo "Backups cleared."
    else
        echo "Backups were not cleared."
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
