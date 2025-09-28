#!/bin/bash

# Launch 1 EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id ami-09c813fb71547fc4f \
  --count 1 \
  --instance-type t3.micro \
  --query "Instances[0].InstanceId" \
  --output text)

echo "Launched instance: $INSTANCE_ID"

# Wait 2 minutes
sleep 120

# Terminate the instance
aws ec2 terminate-instances --instance-ids $INSTANCE_ID

echo "Terminated instance: $INSTANCE_ID"
