#!/bin/bash

fruits=("apple" "banana")
fruits=fruits+("mango")   # Add one element
fruits+=("orange" "grapes") # Add multiple elements

echo "Updated fruits: ${fruits[@]}"
