#!/bin/bash

# Step 1: Define an array of servers
servers=("192.168.1.1" "192.168.1.2" "google.com")

# Step 2: Loop through each server in the array
for server in "${servers[@]}"; do

    # Step 3: Ping the server once, suppress output
    # -c 1 → send 1 ping
    # &>/dev/null → discard all output (stdout + stderr)
    if ping -c 1 $server &>/dev/null; then
        # Step 4: If ping succeeds (exit status = 0)
        echo "✅ $server is UP"
    else
        # Step 5: If ping fails (exit status != 0)
        echo "❌ $server is DOWN"
    fi

done
