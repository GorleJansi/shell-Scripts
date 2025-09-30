#!/bin/bash
while true; do
    echo "Running... (Ctrl+C to stop)"
    sleep 1
done


# while true → true is always true, so the loop never ends.
# do ... done → defines the body of the loop.


for ((;;))
do
 echo "infinite"
done

# Syntax: for ((initialization; condition; increment)).
# If all three parts are empty, it loops infinitely (;;).
# do ... done → defines the loop body.