1. Disable root user
2. sudo yum remove nc
2. backup critical services
2. stop sshd if its not needed
2. setup firewall
    - service iptables restart
    - /etc/sysconfig/iptables
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
:TCP - [0:0]
:UDP - [0:0]
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate INVALID -j DROP
-A INPUT -p icmp -m icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-proto-unreachable
-A TCP -p tcp --dport 22 -j ACCEPT
-A TCP -p tcp --dport 80 -j ACCEPT
COMMIT
3. check /etc/passwd - remove the 'system' user
4. check the crontab 
6. harden sshd.conf 
    - ssh is openSSH 5.3
7. start running scripts 
8. harden php
9. Move the grub-install package 
10. investigate disabling ipv6
    - /etc/sysctl.d/40-ipv6.conf
    - net.ipv6.conf.all.disable_ipv6 = 1
