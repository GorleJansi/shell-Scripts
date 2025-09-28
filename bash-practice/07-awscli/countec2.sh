#!/bin/bash

# Get count of running instances
COUNT=$(aws ec2 describe-instances \
  --filters Name=instance-state-name,Values=running \
  --query "Reservations[*].Instances[*].InstanceId" \
  --output text | wc -w)

echo "Number of running instances: $COUNT"
