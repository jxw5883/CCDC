# CCDC 2020

Outline of this year's competition, responsibilities, and after action report.

### Upcoming Events
- Conference Call 3/20 (Friday) 7:30 - 9:30 PM E101. Questions to cover:
  - Will we have internet access from the VMs? How "wide"? **Yes**
  - Why do we need to have the hosts running? They don't have any pertinent services. **You don't. They aren't scored**
  - Services like fail2ban allowed? **No since reports have to be submitted before blocking**
  - Snapshots? **No**
  - Does the Palo Alto firewall come with an active WildFire or any other security subscription? **No updating the PA**

- Competetion 3/21 (Saturday) 3:00 - 8:00 PM E164 w/ an hour setup

### Machines

- Palo Alto F/W
- Phantom 4.1.94
- Debian 7.8
  - Service Required - MySQL
- Ubuntu 12.04
  - Service Required - DNS
- Win 2008 R2
  - Services Requried - AD, DNS, Exchange
- Win 8.1
- Win 10
- Splunk 7.2.0
- CentOS 6.0
  - Service Required - Ecomm
- Fedora 21
  - Services Required - Webmail and WebApps

### Services "Outlined"
- HTTP
- HTTPS
- SMTP
- POP3
- DNS

### Team Coverage
- Brant - Win 8.1 (> PA) **Giving up box to Namo/Petr to configure PA/Phantom**
- Petr - Phantom 4.1.94 > Splunk
- Namo - PA > Win 2008
- Justin - CentOS w/ Ecomm > Debian
- Matt - Win 2008 > Win 10
- Mark - Ubuntu w/ DNS
- Jason - Debian w/ MySQL
- Evan - Fedora 21 w/ Webmail and WebApps

### Team Coverage after the Call
_Shutdown Phantom and Ubuntu at beginning of competition._
- Brant - Win 10 > Injects and IR
- Petr - Splunk > CentOS/Debian
- Namo - PA **Sourcing from Win 8.1** > Win 2008
- Justin - CentOS w/ Ecomm > Debian
- Matt - Win 2008 > Win 10
- Mark - Fedora 21 w/ Webmail and WebApps
- Jason - Debian w/ MySQL
- Evan - Fedora 21 w/ Webmail and WebApps

### After Action Report

#### Business Tasks (Injects)

#### Phantom 4.1.94
Pre-Comp


Comp


Post-Comp


#### Debian 7.8
Pre-Comp
--check users that need to be on the system so i know whats weird
--learn how mysql works so i can run the mysql_secure_installation thing to make it secure


Comp
--change password on root and sysadmin
--iptables -F to flush in case there's dumb network rules
--uninstall nc because netcat sucks
--remove ssh auth keys
--edit sshd_config file to disallow root login, change port to something other than 22 so its not obvious (we needed SSH to access the MySQL database from the web server)
--add sysadmin to sudoers
--check /etc/passwd for weird users, change all shells i dont need to /bin/false
--check /etc/sudoers
--check /etc/sudoers.d
--edit the mysql tables to allow a specific user to have access to the frog table that we needed (on localhost, then the web server SSHes into it with -L to "pretend" like he's localhost accessing all of it)
--upgrade system (change sources to archive.debian.org......)
--check .bashrc for weird stuff
--uninstall cron
--uninstall/disable apache2
--check home folder for suspicious things/files as hints to problems
--after all upgrades done, install ufw and deny everything (default deny in & out) except access to the web server on ONE port (SSH so he could access the MySQL)
  --if something was going on with the web server, i cut the ssh connection so it wouldnt spread to my system, then when he was ready to go again i re enabled it
  
 --when the competition was about to end and everyones systems were dying I just denied everything and sat there staring at my screen while all the other systems died


Post-Comp
--n/a

#### Ubuntu 12.04
Pre-Comp


Comp


Post-Comp

#### Win 2008 R2
Pre-Comp


Comp


Post-Comp

#### Win 8.1
Pre-Comp


Comp


Post-Comp

#### Splunk 7.2.0
Pre-Comp


Comp


Post-Comp

#### CentOS 6.0
Pre-Comp

- I found that google was a really good resource

Comp

- user logged in as _vmd, ran killall -u _vmd, disabled sshd, and deleted the user

- sit0 interface opened?

- 4:30 sshd service started. Killed sshd.
- 4:37 sshd service started again?
- 5:09 noticed a lot of python, killed using killall python

- 5:46 Noticed that ls shows a picture of a rabbit, my username has been changed to charminultrasoft
    - sudo yum install --disableexcludes=all update
    - finally running an update!
    - fixed by updating coreutils
    
- Removed nc, sshd
- 6:08 noticed crontab and php have a script that downloads and runs a backdoor

- 6:16 got e-commerce up after setting the DB, 

- 7:30 uninstalled cronie to finally remove all backdoors 
- 7:36 centos slowed to a halt and I needed to restart
- 7:4? centos is completely pwned  

Post-Comp

- I wish I looked into apache much earlier on
- I should've realized that I could find the php configuration file 

#### Fedora 21
Pre-Comp


Comp


Post-Comp
