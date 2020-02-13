# Ubuntu 18.04 STIG

Written by Brant Goings

### SSH

1. Edit sshd.conf
```
sudo nano /etc/ssh/sshd_config
```
2. Config to check
```
Protocol 2
AllowUsers *validuser1 validuser2*
DenyUser baduser1 baduser2
PermitRootLogin no
HostbasedAuthentication no
AllowTcpForwarding no
X11Forwarding no
LogLevel VERBOSE
PermitEmptyPasswords no
```
3. Restart SSH
```
sudo service ssh restart
```

### Check F/W

1. Check current rules
```
sudo iptables -L
```
2. Allow established/related
```
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

3. Allow specific ports
```
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT
```
4. Logging
```
sudo iptables -I INPUT 5 -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
```

### Check Misc.
1. Check passwd file
```
tail /etc/passwd
```
2. Check CRON
```
sudo crontab -e
```
3. Check networking config
```
ip addr
```
