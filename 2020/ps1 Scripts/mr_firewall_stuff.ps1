Get-NetFirewallRule -Direction Outbound | %{$_.Name; $_ | Get-NetFirewallApplicationFilter} # gets outgoing connections and displays the program running it
Get-NetFirewallRule -Direction Inbound | %{$_.Name; $_ | Get-NetFirewallApplicationFilter} # gets incoming connections and displays the program running it

Get-NetFirewallProfile -Name * # gets all profile names
Get-NetFirewallProfile -Name Domain | Get-NetFirewallRule | ? DisplayName -like File* # gets DisplayNames that start with File for Domain profile

Disable-NetFirewallRule -Action Block -Enabled True -Direction Inbound # disables blocking of inbound rules, shamelessly stolen from the interwebs

get-netfirewallprofile | select name,DefaultInboundAction,DefaultOutBoundAction | ft -a # default rules for all profiles

# going to add writing each of these to a file later, i guess