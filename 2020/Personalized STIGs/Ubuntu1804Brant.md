# Ubuntu 18.04 STIG
Written by Brant Goings - CCDC 2020

---
#### Users
1. Check passwd file
```
tail /etc/passwd
```
2. Strengthen user passwords
```
sudo passwd root
```

---
#### SSH

1. Edit sshd.conf
```
sudo nano /etc/ssh/sshd_config
```
```
Protocol 2
AllowUsers validuser1 validuser2
DenyUser baduser1 baduser2
PermitRootLogin no
HostbasedAuthentication no
AllowTcpForwarding no
X11Forwarding no
LogLevel VERBOSE
PermitEmptyPasswords no
```
```
sudo service ssh restart
```
1. Check SSH keys
```
cat ~/.ssh/known_hosts
cat ~/.ssh/authorized_keys
```
---
#### Check F/W

1. Check current rules
```
sudo iptables -L
```
1. Allow established/related
```
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

1. Allow specific ports
```
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT
```
1. Logging
```
sudo iptables -I INPUT 5 -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
```

---
#### Check Misc.
1. Check CRON
```
sudo crontab -e
```
1. Check networking config
```
ip addr
```
1. Install fail2ban
```
sudo apt-get install fail2ban
sudo nano /etc/fail2ban/jail.local
```
```
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
```
```
sudo systemctl restart fail2ban
```
