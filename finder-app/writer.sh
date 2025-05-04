#!/bin/bash

writefile=$1
writestr=$2

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Missing arguments. Usage: $0 <filename> <string>"
    exit 1
else
    
    # get dir path
    dirpath=$(dirname "$writefile")
    
    # create or overwrite directory if it does not exist

    mkdir -p "$dirpath" 

    if [ $? -ne 0 ]; then
        echo "Failed to create directory $dirpath"
        exit 1
    fi

    # write to filename
    echo "$writestr" > "$writefile"

    if [ $? -ne 0 ]; then
        echo "Failed to write to file $writefile"
        exit 1
    fi

fi