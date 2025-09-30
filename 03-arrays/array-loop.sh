#!/bin/bash

fruits=("apple" "banana" "mango")

# Using for loop
for i in "${fruits[@]}"
do
    echo "Fruit: $i"
done

# "${fruits[@]}" → all values
# "${!fruits[@]}" → all indices

# Using index
for i in "${!fruits[@]}"
do
    echo "Index $i: ${fruits[$i]}"
done
