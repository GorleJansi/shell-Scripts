#!/bin/bash
action="$1"      # $1 is what you type after the script name when running it.
username="$2"    #  second command-line argument ($2)
case $action in
    "add")
        useradd "$username"
        ;;
    "modify")
        usermod -s /bin/bash "$username"
        ;;
    "delete")
        userdel "$username"
        ;;
    *)
        echo "Usage: $0 {add|modify|delete}   
        username"
        exit 1  #  Output: Usage: ./script.sh {add|modify|delete} username ,exit 1 exits the script with a non-zero status, indicating an error.
        ;;
Esac