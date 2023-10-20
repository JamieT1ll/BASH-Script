#!/bin/bash
log() {
  echo "$(date) - User $(whoami) - $1" >> "./logfile.txt"
}

echo "Enter name for new repository: "
read rName
echo "Creating $rName..."
mkdir -p "$rName/mainBranch/logFile"
date > "$rName/mainBranch/logFile/logfile.txt"
log "Created repository '$rName'"
echo "Repository created"
