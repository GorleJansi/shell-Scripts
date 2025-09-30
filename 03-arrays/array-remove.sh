#!/bin/bash

fruits=("apple" "banana" "mango" "orange")
unset fruits[1]  # Remove element at index 1 (banana)

echo "Fruits after removal: ${fruits[@]}"
