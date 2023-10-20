#!/bin/bash

log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

echo "Enter the name of the Repository you want to work with: "
read rName

if [ -d "$./branches" ]; then
  echo "Repository found in '$./branches':"
  ls "$./branches"

  echo "Enter the Repository you want to work with: "
  read branchName

  branchDir="$./branches/$branchName"

  if [ -d "$branchDir" ]; then
    echo "Repository '$branchName' selected."

    while true; do
      echo "Files in Repository '$branchName':"
      ls "$branchDir"
      
      echo "Enter the name of the file you wish to edit (or 'exit' to quit): "
      read fileName
      
      if [ "$fileName" == "exit" ]; then
        break
      fi
      
      if [ -e "$branchDir/$fileName" ]; then
        cp "$branchDir/$fileName" "$branchDir/backup/$fileName"
        log "Edited file"
        nano "$branchDir/$fileName"
      else
        echo "File '$fileName' does not exist in Repository '$branchName'."
      fi
    done
  else
    echo "Repository '$branchName' does not exist."
  fi
else
  echo "Repository directory './branches' not found."
fi
