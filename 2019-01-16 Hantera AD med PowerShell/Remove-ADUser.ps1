$members = Get-ADUser -Filter 'department -eq "dev" -or department -eq "test"'
Remove-ADGroupMember -Identity testAdministrators -Members $members