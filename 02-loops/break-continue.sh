#!/bin/bash
for i in {1..10}
do
  if (( i == 3 )); then
    continue   # skip current iteration when i=3
  elif (( i == 9 )); then
    break      # stop entire loop when i=9
  fi
  
  echo "number: $i"
done


# 🔄 Flow
# Loop runs from 1 to 10.
# When i=3 → continue → skips printing 3.
# When i=9 → break → loop stops completely.
# Otherwise, prints the number.