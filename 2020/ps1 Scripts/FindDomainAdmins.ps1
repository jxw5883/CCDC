# Namo's domain-admins-discovery spell!
# Note: script not yet tested in a domain environment, it may not work (properly) until later revisions...

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
