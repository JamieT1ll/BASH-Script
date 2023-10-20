#!/bin/bash

while true; do
    clear
    echo "current repositories:"
    ls -I menu

    echo "Enter 1 to create a new Repository"
    echo "Enter 2 to add a file to a Repository"
    echo "Enter 3 to delete a file from a Repository"
    echo "Enter 4 to edit an existing file"
    echo "Enter 5 to merge a branch"
    echo "Enter 6 to check logs."
    echo "Enter 7 to check-out files"
    echo "Enter e to exit this menu"

    echo -e "\nenter your choice: "
    read choice

    case $(echo "$choice" | tr '[:upper:]' '[:lower:]') in

    1)
    ./createRepository.sh
    ;;

2)
    ./addToRepository.sh
    ;;

3)
    ./deleteFile.sh
    ;;

4)
    ./editFile.sh
    ;;

5)
    ./mergeBranch.sh
    ;;

6)
    ./checklogs.sh
    ;;
7)
    ./checkout.sh
    ;;


e)
    echo "Exiting the menu."
    exit
    ;;


    e|exit)
        echo "Exiting the menu"
        exit
        ;;
    *)
        echo "Invalid choice. Try again"
        ;;
    esac

    read -n 1 -s -r -p "Press any key to continue..."
done

