#!/bin/bash
# Justin and Jason

while [ 0 != 1 ]
do
	ps -ef | grep -e " bash" -e " sh" | grep -v 'gre'
	sleep 0.2
	clear
done

# One way
watch -n 0.5 -d=cumulative 'ps -faux | grep -e "bash" -e " sh" | grep -v "grep"'

# Two way
find /dir/to/search/ -name ".*" -print

# Four way
ls -l -d .[!.]?*
