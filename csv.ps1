$csv = Import-Csv C:\Users\Administratör.TESTEST123\Desktop\test2.csv
foreach ($i in $csv) {
$i | Format-List *
$Fname = $i.SamAccountName.Split()[0].subString(0, 3)
$Lname = $i.SamAccountName.Split()[1].subString(0, 3)
$username = $Fname + $Lname


Write-Host $username


New-ADuser -Name $i.Name -DisplayName $i.DisplayName -SamAccountName "$username" -UserPrincipalName $i.UPN -GivenName $i.UserFirstname -Surname $i.UserLastname -Description $i.Description 
}
