Ubuntu Hardening Guide -- MR

# Create Non-Root User:
    useradd $USERNAME_GOES_HERE
    passwd $USERNAME_GOES_HERE

# Disable Users:
    sudo passwd -l $USERNAME_GOES_HERE # disables this account
    sudo passwd -u $USERNAME_GOES_HERE # re-enables the account

# Give New User Sudo Access:
    usermod -aG sudo $USERNAME_GOES_HERE # -a(ppend)G(roup)

# Modify Sudoers file:
    visudo
    root ALL=(ALL:ALL) ALL # going to break this down for the new people
    # root --> the user
    # ALL --> applies to all hosts
    # ALL --> this user (root) can run commands as all users
    # ALL --> this user (root) can run commands as all groups
    # ALL --> the above rules apply to all commands

# Verify Users with UID of 0:
    awk -F: '($3=="0"){print}' /etc/passwd

# Check for Accounts with Blank Passwords:
    cat /etc/shadow | awk -F: '($2==""){print $1}'

# Key-Based SSH:
    cd ~; 
    ssh-keygen -t rsa -b 4096
    ssh-copy-id $USERNAME_GOES_HERE@$IP_ADDR_GOES_HERE

# Harden SSH:
    sudo vi /etc/ssh/sshd_config # scroll to bottom
    PermitRootLogin no # this sets the ability to ssh in as "root" to no
    PermitEmptyPasswords no # ssh without password set to no
    PasswordAuthentication no # if you want to use key-based ssh
    Port $PORT_NUM_GOES_HERE # if you want to change the port...
    Protocol 2 # this turns it to key-based ssh... see above
    AllowUsers $USERNAME_GOES_HERE # or see below
    AllowUsers *@$IP_ADDR_GOES_HERE # i.e., *@192.168.1.*
    ListenAddress $IP_ADDR_GOES_HERE # can also be used to accept connections only from certain subnets
    DenyUsers $USERNAME_GOES_HERE
    DenyUsers $IP_ADDR_GOES_HERE
    AllowUsers $USERNAME_GOES_HERE@$IP_ADDR_GOES_HERE # save and quit
    sudo service ssh restart

# Harden the Firewall -- UFW:
    sudo ufw allow $SERVICE_NAME_HERE # i.e., sudo ufw allow ssh
    sudo ufw enable
    sudo ufw status verbose

# Harden the Firewall -- IPTables:
    iptables -A INPUT -p tcp -m tcp --dport $DST_PORT_NUM -m state --state NEW,ESTABLISHED -j ACCEPT # i.e., 22 for $DST_PORT_NUM
    iptables -P INPUT DROP # automagically drops packets without a rule, or
    iptables -A INPUT -j DROP

# Secure Shared Memory:
    sudo vi /etc/fstab
    tmpfs /run/shm tmpfs defaults,noexec,nosuid 0 0

# Prevent IP Spoofing:
    sudo vi /etc/host.conf
    order bind,hosts
    nospoof on
