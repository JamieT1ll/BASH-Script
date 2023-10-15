#!/bin/bash

echo "Which of the following repositories contains the file you wish to edit?: "
ls -I menu
read rName

while true; do
    if [ -d "$rName/mainBranch" ]; then
        cd "$rName/mainBranch"
        echo "Files in the repository:"
        ls
        echo -e "\n"

        while true; do
            echo "Would you like to edit the file on the main branch?"
            echo "['y' for yes, 'n' for no]: "
            read choice

            case "$choice" in
            [yY])
                echo "Enter the name of the file you wish to edit: "
                read fileName

                if [ -e "$fileName" ]; then
                    cp "$fileName" "../backup/$fileName"  # Store a copy in the 'backup' folder
                    nano "$fileName"
                    break 2
                else
                    echo "File '$fileName' does not exist in the main branch."
                fi
                ;;
            [nN])
                while true; do
                    echo "Does the branch already exist? (y/n): "
                    read branchExistsChoice

                    case "$branchExistsChoice" in
                    [yY])
                        echo "List of existing branches:"
                        ls -d */  # List all directories (branches) in the current directory
                        echo "Enter the name of the branch you want to switch to: "
                        read branchName

                        if [ -d "$branchName" ]; then
                            cd "$branchName"
                            ls
                            echo "Enter the name of the file you wish to edit: "
                            read fileName

                            if [ -e "$fileName" ]; then
                                cp "$fileName" "../backup/$fileName"  # Store a copy in the 'backup' folder
                                nano "$fileName"
                                break 3  # Exit outer while loop as well
                            else
                                echo "File '$fileName' does not exist in branch '$branchName'."
                            fi
                        else
                            echo "Branch '$branchName' does not exist."
                        fi
                        ;;
                    [nN])
                        echo "Enter new branch name: "
                        read branchName

                        if [ -d "$branchName" ]; then
                            echo "Branch '$branchName' already exists."
                        else
                            mkdir "$branchName"

                            echo "Enter the name of the file you wish to edit: "
                            read fileName

                            if [ -e "$fileName" ]; then
                                cp "$fileName" "../backup/$fileName"  # Store a copy in the 'backup' folder
                                cd "$branchName"
                                nano "$fileName"
                                break 2
                            else
                                echo "File '$fileName' does not exist in the main branch."
                            fi
                        fi
                        ;;
                    *)
                        echo "Invalid input. Please enter 'y' for yes or 'n' for no."
                        ;;
                    esac
                done
                ;;
            *)
                echo "Invalid input. Please enter 'y' for yes or 'n' for no."
                ;;
            esac
        done

        cd ~/assignment1
        break
    else
        echo "Invalid repository name. Please check if the repository exists."
        echo "Enter the repository containing the file: "
        echo "Which of the following repositories contains the file you wish to edit?: "
        ls -I menu
        read rName
    fi
done
