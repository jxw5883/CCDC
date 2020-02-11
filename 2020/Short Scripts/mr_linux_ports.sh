#!/bin/bash

#ss -tup4 state connected # p requires root
#netstat -atnp | grep ESTA # p requires root

if [ "$1" == "0" ]; then
    watch -d -n 0 "netstat -atnp | grep ESTA"

elif [ "$1" == "1" ]; then
    watch -d -n 0 "ss -tup4 state connected" # d for differences, n for time

else
    echo "Please enter 0 to use netstat, or 1 to use ss."
fi
