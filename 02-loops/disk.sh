#!/bin/bash

# List of EC2 Public DNS names
servers=("107.21.157.14" "3.85.205.198")
key="/Users/jgorle/Downloads/test.pem"
user="ec2-user"  # change to 'ubuntu' if using Ubuntu AMI

for s in "${servers[@]}"; do
    echo "🔎 Checking $s..."

    # Run SSH once, capture output and exit status
    output=$(ssh -i "$key" -o ConnectTimeout=5 -o StrictHostKeyChecking=no $user@$s "df -h" 2>&1)
    status=$?

    if [ $status -eq 0 ]; then
        echo "✅ $s is UP. Disk usage:"
        echo "$output"
    else
        echo "❌ $s is DOWN or unreachable."
        echo "Error: $output"
    fi

    echo "------------------------"
done
