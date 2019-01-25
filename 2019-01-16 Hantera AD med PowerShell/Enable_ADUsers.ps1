Get-ADUser -Filter '(surname -eq "hopper") -or (surname -eq"turning")' |
    Set-ADUser -Enabled $true