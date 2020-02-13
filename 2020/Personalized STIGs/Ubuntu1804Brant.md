# Ubuntu 18.04 STIG
Written by Brant Goings - CCDC 2020

Jump to [Users](#Users), [SSH](#SSH), [F/W](#F/W), [Scripts](#Scripts), or [Misc](#Misc)

---
#### Users
1. Check passwd file
```bash
tail /etc/passwd
```
2. Strengthen user passwords
```bash
sudo passwd root
```

---
#### SSH

1. Edit sshd.conf

  Method 1 - Script
  ```bash
  nano updatessh.sh
  ```
  ```bash
  #!/bin/bash
  sudo sed -i '/^Protocol/s/1/2/' /etc/ssh/sshd_config
  #Insert AllowUsers
  #Insert DenyUser
  sudo sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
  sudo sed -i '/^HostbasedAuthentication/s/yes/no/' /etc/ssh/sshd_config
  sudo sed -i '/^AllowTcpForwarding/s/yes/no/' /etc/ssh/sshd_config
  sudo sed -i '/^X11Forwarding/s/yes/no/' /etc/ssh/sshd_config
  sudo sed -i '/^LogLevel/s/yes/no/' /etc/ssh/sshd_config
  sudo sed -i '/^PermitEmptyPasswords/s/yes/no/' /etc/ssh/sshd_config
  sudo service ssh restart
  ```
  ```bash
  sudo chmod 755 updatessh.sh
  sudo ./updatessh.sh
  ```

  Method 2 - Manual
  ```bash
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
  ```bash
  sudo service ssh restart
  ```
2. Check SSH keys
```bash
cat ~/.ssh/known_hosts
cat ~/.ssh/authorized_keys
```
---
#### F/W

1. Check current rules
```bash
sudo iptables -L
```
2. Allow established/related
```bash
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
```

3. Allow specific ports
```bash
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT
```
4. Logging
```bash
sudo iptables -I INPUT 5 -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
```

---
#### Scripts

1. Notify logon
```bash
echo "notify-send -t 3000 \"User logged in\" \`whoami\`" > /etc/profile.d/notify_log.sh
echo "wall -n \"User logged in\" \`whoami\`" >> /etc/profile.d/notify_log.sh
```
2. SSH login attempts
```bash
nano logattempt.sh
```
```bash
#!/bin/bash
echo "running..." > /dev/tty
while :
do
  logFile=$(cat /var/log/auth.log | grep "authentication failure")
  knownFailures=$(cat ./knownFailures)
	echo "checking failures..." > /dev/tty
        output=$(diff <(echo "$logFile") <(echo "$knownFailures"))
        echo "$output" > /dev/tty
echo "saving results..." > /dev/tty
echo "$logFile" > ./knownFailures
sleep 5
done
```
```bash
sudo chmod 755 logattempt.sh
sudo ./logattempt.sh
```
3. Monitor sockets
```bash
nano sockmon.sh
```
```bash
#!/bin/bash
ss > /tmp/tcpcm.p.tick
ss > /tmp/tcpcm.c.tick
while true
do
    mv /tmp/tcpcm.c.tick /tmp/tcpcm.p.tick
    ss > /tmp/tcpcm.c.tick
    /usr/bin/diff -u /tmp/tcpcm.p.tick /tmp/tcpcm.c.tick | grep -E "^\+"
    sleep 1
done
```
```bash
sudo chmod 755 sockmon.sh
sudo ./sockmon.sh
```
---
#### Misc
1. Check CRON
```bash
sudo crontab -e
```
2. Check networking config
```bash
ip addr
```
3. Install fail2ban
```bash
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
```bash
sudo systemctl restart fail2ban
```
