#!/bin/bash

DATE=$(date)
ECHO $DATE

START_TIME=$(date +%s)
echo $START_TIME

sleep 10

END_TIME=$(date +%s)
echo $END_TIME

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in: $TOTAL_TIME Seconds"