#!/bin/bash
echo $UID
apt-get install -q iptables
/etc/init.d/iptables save
/etc/init.d/iptables status
/etc/init.d/iptables starts
/etc/init.d/iptables stop
done
