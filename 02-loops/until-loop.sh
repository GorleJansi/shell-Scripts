# Use until when you want to loop until a condition is true.

# !/bin/bash
count=1
until [ "$count" -gt 5 ];
do 
 echo "$count"
 ((count++))         #  increament,count stays 1 forever.loop runs infinitely
done


# 🔄 Flow 
# Start: count=1
# Condition: 1 -gt 5 → false → run → prints 1 → increments → 2
# Condition: 2 -gt 5 → false → run → prints 2
# …
# When count=6: 6 -gt 5 → true → loop stops