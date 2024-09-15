#!/bin/bash

# Directory to check (can pass as an argument or hardcode)
DIRECTORY="${1:-.}"

# Iterate over each file in the directory
for file in "$DIRECTORY"/*; do
    # Check if the file is readable and has non-zero size
    if [ ! -r "$file" ] || [ ! -s "$file" ]; then
        echo "Deleting broken file: $file"
        rm "$file"
    fi
done

echo "Cleanup complete."
