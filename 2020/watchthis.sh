#!/bin/bash

# Compares two files provided in the arguments to test for changes
# Make sure to copy the original file the first time
# Use watch or cron to automate

FILE1=$1
FILE2=$2
diff "$FILE1" "$FILE2"
cp "$FILE1" "$FILE2"
