# Ubuntu 18.04 STIG

## Written by Brant Goings

### SSH

1. Secure sshd.conf
```
sudo nano /etc/ssh/sshd_config
```

Protocol 2

Permit certain users
```
AllowUsers *validuser1 validuser2*
```

DenyUser baduser1 baduser2


PermitRootLogin no


HostbasedAuthentication no


AllowTcpForwarding no


X11Forwarding no


LogLevel VERBOSE


PermitEmptyPasswords no

sudo service ssh restart
```

2. Check F/W

```
iptables
```
