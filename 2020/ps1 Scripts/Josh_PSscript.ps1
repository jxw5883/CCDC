# Script not tested in a domain environment so no idea if they actually work
# The last two commands could be put into a separate script

# Get all AD users list with created date, last changed and last login date
Get-ADUser -Filter * -Properties * | select Name,whenCreated,whenChanged,LastlogonDate

#Get-ADUser to see password last set and expiry information and more
Get-ADUser -filter * -Properties passwordlastset, passwordneverexpires | sort name | ft Name, passwordlastset, Passwordneverexpires 

#How to Remove a specific User
Remove-LocalUser -Name "User_Account_Name"

#How to Remove Users from the Administrators group
Remove-LocalGroupMember -Group "Administrators" -Member "Example_user1", "ex_user2"