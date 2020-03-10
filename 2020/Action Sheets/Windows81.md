# Windows 8.1 Action Sheet

Brant Goings - CCDC 2020

### 1. Users

```
Get-ADUser -Filter * -Properties * | select Name,whenCreated,whenChanged,LastlogonDate

Get-ADGroupMember -Identity Administrators

Disable-ADAccount -Identity user
```

### 2. F/W

```
Get-NetFirewallProfile

Get-NetFirewallProfile -Name Public | Get-NetFirewallRule

Get-NetFirewallRule | Where-Object {$_.Description -like "*80*"} | ft DisplayName, Profile, Enabled
```

### 3. Services
- Disable RDP
- Disable SMB
