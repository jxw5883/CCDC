#Lists all users with last password change and logon date

Get-ADUser -filter * -Properties passwordlastset, LastlogonDate

#List which users are in a group

Get-ADGroupMember 