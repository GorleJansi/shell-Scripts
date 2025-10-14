#!/bin/bash

count_lines() {
    if [[ -f "$1" ]]; then
        lines=$(wc -l < "$1")
        echo "📄 File '$1' has $lines lines"
    else
        echo "❌ File '$1' not found"
    fi
}

read -p "Enter a file: " f
count_lines "$f"
