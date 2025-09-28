#!/bin/bash

# Get current date in seconds since epoch
NOW=$(date +%s)

# Fetch instance IDs + LaunchTime for running instances
aws ec2 describe-instances \
  --filters Name=instance-state-name,Values=running \
  --query "Reservations[].Instances[].[InstanceId,LaunchTime]" \
  --output text | while read ID TIME; do
    
    # Convert LaunchTime (UTC) to epoch
    LAUNCH_SEC=$(date -d "$TIME" +%s)
    
    # Calculate age in days
    AGE=$(( (NOW - LAUNCH_SEC) / 86400 ))

    if [[ $AGE -gt 7 ]]; then
      echo "Stopping instance $ID (running for $AGE days)"
      aws ec2 stop-instances --instance-ids $ID
    fi
done
