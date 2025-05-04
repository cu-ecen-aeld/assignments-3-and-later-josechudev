#!/bin/bash

filesdir=$1
searchstr=$2


if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Missing arguments. Usage: $0 <directory> <search_string>"
    exit 1
elif [ ! -d "$filesdir" ]; then
    echo "Directory $filesdir does not exist."
    exit 1
else
    # Count the number of files in the directory (X)

    num_files=$(find "$filesdir" -type f | wc -l)

    # Count the number of lines matching the search string (Y)

    num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

    echo "The number of files are $((num_files)) and the number of matching lines are $((num_matches))"

    
fi
