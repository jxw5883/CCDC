# Returns F/W Profiles and details about them
Get-NetFirewallProfile

# Filters out rules in Public profile
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule

# These are the same
Get-NetFirewallRule -Enabled True
(Get-NetFirewallRule).Enabled

Get-NetFirewallRule | Where-Object {$_.Enabled -like "True"}

Get-NetFirewallRule | Where-Object {$_.Description -like "80"} # Finds more specific stuff too

Get-NetFirewallRule | Where-Object {$_.Description -like "*80*"} | ft DisplayName, Profile, Enabled

Get-NetFirewallRule | ft Name, DisplayGroup

Disable-NetFirewallRule

# | outfile -FilePath doc.txt

Get-NetConnectionProfile

# Decent stuff found here: https://devblogs.microsoft.com/scripting/learn-how-to-use-powershell-to-parse-the-firewall-log/
# Talks about narrowing log files down to hits per rule

netsh advfirewall show allprofiles | Select-String Filename

# Checking a domain's F/W status: https://isc.sans.edu/forums/diary/Powershell+Active+Directory+and+the+Windows+Host+Firewall/24706/

Set-NetFirewallProfile -name domain -LogMaxSizeKilobytes 10240 -LogAllowed true -LogBlocked true

# import-csv, get-member