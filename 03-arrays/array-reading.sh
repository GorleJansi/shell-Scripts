#!/bin/bash

read -p "Enter names separated by space: " -a names
echo "You entered: ${names[@]}"
echo "length of array : ${#names[@]}"
echo "first element : ${names[0]}"
