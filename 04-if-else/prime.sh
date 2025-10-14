# !/bin/bash
read -p "enter a number:" n
count=0
if [ "$n" -le 1 ]; then
    echo "$n is not a prime number."
fi    
for ((i=1; i<=$((n/2)); i++))
do    
    if [ $((n%i)) -eq 0 ];then
        ((count++))  
    fi          
done    
((count++))   #   Adds 1 to include n itself.
if [ $count -gt 2 ];then
    echo "number $n is not a prime"
else
    echo "number $n is a prime"
fi