#!/bin/bash

echo "Do you want to check out or check in a file?"
PS3='Select an action: '
options=("1. Check-out file" "2. Check-In file")
select action in "${options[@]}"
do
    case $action in
       "1")
            read -p "Enter the filename to check out: " Fcheckout
            if [ -e "mainBranch/$Fcheckout" ]; then
                mv "mainBranch/$Fcheckout" "./checkout"
                echo "Checked out: $Fcheckout"
            else
                echo "File not found: $Fcheckout"
            fi
            ;;

        "2")
           echo "Files available for check-in:"
          ls "../checkout"
           read -p "Enter the filename to check in: " Fcheckin
  
          if [ -e "../checkout/$Fcheckin" ]; then
             mv "../checkout/$Fcheckin" "mainBranch/"
             echo "Checked out: $Fcheckin"
          else

        echo "File not found: $Fcheckin"
          fi
          ;;


        *)
            echo "Invalid option: please enter a number from the menu for your choice."
            ;;
    esac
    break
done
