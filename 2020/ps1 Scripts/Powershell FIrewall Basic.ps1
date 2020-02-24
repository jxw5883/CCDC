#Gets Enabled Firewall Rules
#Get-NetFirewallRule -Enabled True

#Gets Disabled Firewall Rules
#Get-NetFirewallRule -Enabled False

#Get Firewall Rule Where Primary Status = Error
#Get-NetFirewallRule -PrimaryStatus Error

#Get Firewall Rule Where Primary Status = OK
#Get-NetFirewallRule -PrimaryStatus OK

#Get Firewall Rule Where Primary Status = Inactive
#Get-NetFirewallRule -PrimaryStatus Inactive

#Get Firewall Rule Where Primary Status = Unknown
#Get-NetFirewallRule -PrimaryStatus Unknown

#Gets firewall rules
#Get-NetFirewallProfile -Name Public | Get-NetFirewallRule

#Shows status of firewall
#netsh firewall show state

#Gets inbound traffic
#Get-NetFirewallRule -Direction Inbound

#Gets outbound traffic
#Get-NetFirewallRule -Direction Outbound
