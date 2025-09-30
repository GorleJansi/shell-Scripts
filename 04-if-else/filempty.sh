#!/bin/bash
read -p "Enter a file: " f

if [[ ! -f "$f" ]]; then          #checks if the file exists and is a regular file.
    echo "File $f does not exist"
elif [[ ! -s "$f" ]]; then        #checks if the file is not empty
    echo "File $f is empty"
else                              # File exists and has content
    echo "File $f has content"
fi


# -f "$f" → true if $f exists and is a regular file.
# ! -f "$f" → true if $f does NOT exist or is not a regular file.