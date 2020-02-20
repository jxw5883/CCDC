# Returns F/W Profiles and details about them
Get-NetFirewallProfile

# Filters out rules in Public profile
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule

# This doesn't work
Get-NetFirewallRule -Enabled True | Get-NetFirewallProfile -Name Public

# or this
Get-NetFirewallProfile -Name Public | Get-NetFirewallRule -Enabled True

# Decent stuff found here: https://devblogs.microsoft.com/scripting/learn-how-to-use-powershell-to-parse-the-firewall-log/
# Talks about narrowing log files down to hits per rule

netsh advfirewall show allprofiles | Select-String Filename

# Checking a domain's F/W status: https://isc.sans.edu/forums/diary/Powershell+Active+Directory+and+the+Windows+Host+Firewall/24706/

