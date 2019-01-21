$reportdata = foreach($group in (Get-ADGroup -Filter 'name -like "test*"')) {
        Foreach($member in (Get-ADGroupMember $group)) {
            New-Object -TypeName PSobject -Property @{group=$group.Name;member=$member.name}
        }
    }
$reportData | Out-GridView -Title MembershipReport