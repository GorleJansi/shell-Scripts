#!/bin/bash
name="Jansi"
age=23
if [[ "$name" = "Jansi" && $age -ge 18 ]]; then
    echo "Adult Jansi"
else
    echo "Either unknown or underage"
fi
