#!/bin/bash
read -p "Enter filename: " file
#script checks for the file in the current working directory to check in other directory give complete location
if [[ -f "$file" ]]; then
    echo "File $file exists"
else
    echo "File $file does not exist"
fi
