# Action Sheet - Windows Server 2019 Core
Environment built by Namo Zeigler

Brant Goings - CCDC 2020

Services Required - AD-DS, DNS, SMB

## 1. STIG

#### Windows firewall enabled?
* `firewall.cpl` is the shortcut

#### Startup registry items

Registry paths:
* HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion/Run
* HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion/RunOnce
* HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/Run
* HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/RunOnce

#### Scheduled tasks
* Use `taskschd.msc`. Check for tasks that should not be there

#### Local users, groups, and privileges
* Use `lusrmgr.msc`. Double check group inheritance!

#### Shared drives
* `net share` command reveals a lot

## 2. Powershell

Gets user info

﻿`Get-LocalUser -Name * | Select-Object Name, Enabled, PasswordChangeableDate, PasswordExpires, UserMayChangePassword, PasswordRequired, PasswordLastSet, LastLogon | out-file -FilePath "C:\Users\Ellie Rennard\Desktop\pwchanges.txt"`

Displays default rules for all profiles

`Get-NetFirewallProfile | select name,DefaultInboundAction,DefaultOutBoundAction | ft -a`

Gets F/W profile names

`Get-NetFirewallProfile -Name`

Gets Domain Admins

```
Function FindNestedMember($identity)
{
	$members = Get-ADGroupMember -Identity $identity
    foreach($member in $members){
        if ($member.objectClass -eq "group"){
            echo "Group : $member.name"
            FindNestedMember($member.name)
        }else{
            echo "User : $member.name"
        }
    }
}

FindNestedMember("Domain Admins")
```

Displays rules on port 80 with specific parameters

`Get-NetFirewallRule | Where-Object {$_.Description -like "*80*"} | ft DisplayName, Profile, Enabled`

Log F/W

`Set-NetFirewallProfile -name domain -LogMaxSizeKilobytes 10240 -LogAllowed true -LogBlocked true`

Get-ADUser to see password last set and expiry information and more

`Get-ADUser -filter * -Properties passwordlastset, passwordneverexpires | sort name | ft Name, passwordlastset, Passwordneverexpires`

Block port
```
$num = Read-Host 'Enter Port to Block'
Try{
    netsh advfirewall firewall add rule name="Blocktcp + $num" protocol=TCP dir=in localport = $num action=block
    netsh advfirewall firewall add rule name="Blockudp + $num" protocol=TCP dir=out localport = $num action=block
    #echo $num
    }
    Catch{
        	echo "Blocking failed"
	}
  ```
