# Linux Account STIG
https://www.stigviewer.com/stig/red_hat_enterprise_linux_7/2018-11-28/finding/V-72005
Linux system must be configured so that the root account should be the only account with unrestricted access.
## Description
If another account other than root has a UID of 0, that account has unrestricted access to the entire operating system
## Details
Check the system for duplicate UID 0 assignments:
```
awk -F: '$3 == 0 {print $1}' /etc/passwd
```
Change the UID of any account on the system, other than root, that has a UID of "0".
If the account is associated with system commands or applications, the UID should be changed to one greater than "0" but less than "1000". Otherwise, assign a UID of greater than "1000" that has not already been assigned.
# Prevent reboots when Ctrl+Alt+Del is pressed
## Description
A locally logged in user who presses Ctrl+Alt+Del at the console can reboot the server.
## Details
Check that the ctrl.alt.del.target is masked and not active with the following command:
```
systemctl status ctrl.alt.del.target
ctrl-alt-del.target
Loaded: masked (/dev/null; bad)
Active: inactive (dead)
```
If the ctrl-alt-del.target is active, this is a finding.
Configure the system to disable the Ctrl-Alt_Delete sequence for the command line with the following command:
```
systemctl mask ctrl-alt-del.target
```
