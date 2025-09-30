# !/bin/bash
read -p "enter x value:" x
read -p "enter y value:" y

if ((x>y));then
    echo "${x} is greater ${y}"
else
    echo "${y} is greater ${x} "    
fi    