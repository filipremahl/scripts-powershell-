$name = "Alan Turing","Grace Hopper"
$departments = "Test","Dev","QA"

Foreach($names in $names) {
    ForEach($departments in $departments) {
        $username = "{0}{1}" -f $name.substring(0,1), $name.split()[1]

        $user = New-ADUser -GivenName $name.split()[0] `
                            -Surname $name.split()[0] `
                            -Name "$name$department" `
                            -AccountPassword (ConvertTo-SecureString -String "Linux4Ever" -AsPlainText -Force) `
                            -Department $department `
                            -UserPrincipalName "$username$department@VT17_3.local" `
                            -SamAccountName "$username$department" `
                            -PassThru

        Get-ADGroup -Filter 'name -like "test="' | Add-ADGroupMember -Members $user
    }
}