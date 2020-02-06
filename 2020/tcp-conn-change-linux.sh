#!/bin/bash
# New TCP connection monitoring script by @NamoDev!
#
# This uses the ss command instead of netstat, since it's more likely to be
# avaliable without net-tools (an additional package on at least Ubuntu)

# Get ticks
ss > /tmp/tcpcm.p.tick
ss > /tmp/tcpcm.c.tick

# Update ticks every one second
while true
do
    mv /tmp/tcpcm.c.tick /tmp/tcpcm.p.tick
    ss > /tmp/tcpcm.c.tick
    /usr/bin/diff -u /tmp/tcpcm.p.tick /tmp/tcpcm.c.tick | grep -E "^\+"
    sleep 1
done
