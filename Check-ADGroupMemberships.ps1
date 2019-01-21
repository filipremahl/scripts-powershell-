Get-ADUser -Filter 'givenname -eq "alan" -or givenname -eq "grace"' |
Get-ADPrincipalGroupMembership | 
    Format-Table name,SAMAccountName