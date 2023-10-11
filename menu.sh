#!/bin/bash

while true; do
    clear
    echo "current repositories:"
    ls -I menu

    echo "Enter 1 to create a new repository"
    echo "Enter 2 to add a file to a repository"
    echo "Enter 3 to edit an existing file"
    echo "Enter 4 to merge a branch in an existing repository"
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
        ./editFile.sh
    ;;


    4)
        ./mergeBranch.sh
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

