#!/bin/bash

# Method 1: Using parentheses
fruits=("apple" "banana" "mango")
num=(1 2 3)
# Method 2: Declare and assign later
declare -a veggies
veggies[0]="carrot"
veggies[1]="tomato"
veggies[2]="cucumber"

# Print arrays
echo "Fruits: ${fruits[@]}"
echo "numbers: ${num[@]}"
echo "Vegetables: ${veggies[@]}"
