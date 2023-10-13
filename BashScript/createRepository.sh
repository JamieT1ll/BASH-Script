#!/bin/bash

echo "Enter name for new repository: "
        read rName
        echo "Creating $rName..."
        mkdir -p "$rName/mainBranch/logFile"
        date > "$rName/mainBranch/logFile/logfile.txt"
        echo "Repository created"
