#!/bin/bash
# Variables
read -p "Enter path/directory to store archive: " path
echo "You entered path: '$path'"
# read -p "How old files do you want to archive (in days): " days
# echo "You entered days: '$days'"

# # Validate numeric input for days
# if ! [[ "$days" =~ ^[0-9]+$ ]]; then
#     echo "Error: '$days' is not a valid number."
#     exit 1
# fi

depth=1

# Check if directory exists
if [ ! -d "$path" ]; then
    echo "Directory '$path' doesn't exist."
    exit 1
fi
echo "Directory exists, proceeding..."

# Create archive directory if not present
if [ ! -d "$path/archive" ]; then
    mkdir "$path/archive"
fi

read -p "Enter the minimum file size to archive (in MB): " size
echo "You entered size: '$size MB'"

# Validate numeric input for size
if ! [[ "$size" =~ ^[0-9]+$ ]]; then
    echo "Error: '$size' is not a valid number."
    exit 1
fi

# Find files with size > input size in MB OR older than specified days
files_found=0
for file in $(find "$path" -maxdepth $depth -type f -size +"${size}M"); do
    echo "Archiving $file --> $path/archive"
    gzip "$file" || exit 1
    mv "$file.gz" "$path/archive" || exit 1
    files_found=1
done

if [ $files_found -eq 0 ]; then
    echo "No files found matching the criteria (size > $size MB OR older than $days days)."
else
    echo "Archiving completed."
fi

#C:/users/as999/Downloads