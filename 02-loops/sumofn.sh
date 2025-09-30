# !/bin/bash
read -p "Enter N: " n     # take user input.
sum=0                     # initialize variable.

for ((i=1; i<=n; i++)); do
    sum=$((sum+i))
done

echo "Sum is $sum"


# $(( ... )) is used for arithmetic calculations in Bash.
# sum+i calculates the current sum plus the value of i.
# sum= assigns this new value back to sum.

# without $(( ... )) --> sum+i treated as literal string and assigned to sum

