#!/bin/bash

servers=("192.168.1.1" "192.168.1.2" "192.168.1.3")

for server in "${servers[@]}"
do
    ping -c 1 $server &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Server $server is UP"
    else
        echo "Server $server is DOWN"
    fi
done



# Array → list of servers to check.
# Loop → iterate each server.
# ping -c 1 → test connectivity with 1 packet.
# $? → check success/failure of ping.
# &> /dev/null → redirect both stdout (normal output) and stderr (errors) to /dev/null
# Output message → UP/DOWN.