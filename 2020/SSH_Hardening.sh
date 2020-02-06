#!/bin/bash
# Harden SSH - Evan Eastwood

# Doesn't make any changes... just installs iptables

echo $UID
apt-get install -q iptables
/etc/init.d/iptables save
/etc/init.d/iptables status
/etc/init.d/iptables starts
/etc/init.d/iptables stop
done
