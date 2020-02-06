# Powershell to check last password change per users - Ellie Rennard

# Sort by latest password change? Or filter by password change?
# Needs relative user Desktop, not absolute
﻿Get-LocalUser -Name * | Select-Object Name, Enabled, PasswordChangeableDate, PasswordExpires, UserMayChangePassword, PasswordRequired, PasswordLastSet, LastLogon | out-file -FilePath "C:\Users\Ellie Rennard\Desktop\pwchanges.txt"
