Disable-ADAccount -Identity ATuringQA
Get-ADUser -Identity ATuringQA | Format-Table SAMAccountName,Enabled
Get-ADUser -Filter 'department -eq "QA"' | Disable-ADAccount
Get-ADUser -Filter 'department -eq "QA"' | Format-Table SAMAccountName,Enabled