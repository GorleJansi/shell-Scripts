#!/bin/bash

recipient="$1"
subject="$2"
message="$3"
attachment="$4"  # Optional

if [ -z "$recipient" ] || [ -z "$subject" ] || [ -z "$message" ]; then
    echo "Usage: $0 recipient_email subject message [attachment]"
    exit 1
fi

if [ -f "$attachment" ]; then
    echo "$message" | mail -s "$subject" -a "$attachment" "$recipient"
    #The mail command expects the email body to come from (stdin). That means you either:Pipe content into it or Use a file as input

else
    echo "$message" | mail -s "$subject" "$recipient"
fi

echo "Email sent to $recipient with subject: $subject"
