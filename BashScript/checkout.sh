#!/bin/bash
log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

PS3='What would you like to do with the files?: '
options=("1. Check-out file" "2. Check-In file" "e) Exit")
select opt in "${options[@]}"
do
    case $opt in
        "1")
            # Check-out file
            read -p "Enter the filename to check out: " Fcheckout
            user_checkout_folder="./checkout/$(whoami)"

            if [ -e "mainBranch/$Fcheckout" ]; then
                if [ ! -d "$user_checkout_folder" ]; then
                    mkdir "$user_checkout_folder"  # Create user-specific subdirectory if it doesn't exist
                fi
                mv "mainBranch/$Fcheckout" "$user_checkout_folder/"
                log "Checked out file '$Fcheckout'"
                echo "Checked out: $Fcheckout"
            else
                echo "File not found: $Fcheckout"
            fi
            ;;

        "2")
            # Check-In file
            user_checkout_folder="./checkout/$(whoami)"
            echo "Files available for check-in in your folder:"
            ls "$user_checkout_folder"
            read -p "Enter the filename to check in: " Fcheckin
            read -p "Enter the repository you would like to check it into: " Rname

            if [ -e "$user_checkout_folder/$Fcheckin" ]; then
                if [ ! -d "$Rname/mainBranch" ]; then
                    mkdir -p "$Rname/mainBranch"
                fi
                mv "$user_checkout_folder/$Fcheckin" "$Rname/mainBranch/"
                log "Checked in file '$Fcheckin' into repository '$Rname/mainBranch'"
                echo "Checked in: $Fcheckin"
            else
                echo "File not found in your folder: $Fcheckin"
            fi
            ;;

        "e")
            echo "Exiting the menu."
            exit
            ;;

        *)
            echo "Invalid option: $REPLY, please enter a number from the menu for your choice."
            ;;
    esac
    break
done
