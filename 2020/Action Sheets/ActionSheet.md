Windows Server 2008 R2 Action Sheet:

Active Directory
get-adgroup -identity Administrators
get-adgroupmember 'Administrators' -recursive
Get-RootDSE # LDAP server information
get-addomain # ad information
Get-ADDefaultDomainPasswordPolicy # get default pw policy
Get-ADUser -Filter * # gets all ad users
Disable-ADAccount -Identity x # disable 'x' account
Search-ADAccount -AccountDisabled # search for disabled accounts
Set-ADUser -Identity username -ChangePasswordAtLogon $true # force pw change

Get-AdComputer -filter * # gets computers on domain 
Remove-ADUser -Identity *
Remove-ADGroup -Identity *

set execution-policy unrestricted
$When = ((Get-Date).AddDays(-1)).Date # this and the below line get new users created within 24 hours
Get-ADUser -Filter {whenCreated -ge $When} -Properties whenCreated

import users from CSV (can be changed to delete users listed in CSV):

Import-Csv -Path c:\temp\users.csv | ForEach-Object {
    $givenName = $_.name.split()[0]
    $surname = $_.name.split()[1]
    New-ADUser -Name $_.name -Enabled $true –GivenName $givenName –Surname $surname -Accountpassword (ConvertTo-SecureString $_.password -AsPlainText -Force) -ChangePasswordAtLogon $true -SamAccountName $_.samaccountname –UserPrincipalName ($_.samaccountname+”@ad.contoso.com”) -City $_.city -Department $_.department
}




DNS

Exchange

