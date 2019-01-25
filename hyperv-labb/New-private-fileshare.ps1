$csv = Import-Csv C:\Users\Administratör.TESTEST123\Desktop\test2.csv
foreach ($i in $csv) {
$user = $i.UserPrincipalName
$acc = $i.SamAccountName

New-Item -Path C:\Users\qshare\$user\ -ItemType Directory
New-SmbShare -Name qshare -Path C:\Users\qshare\$user\
Grant-SmbShareAccess -Name $user -AccountName $acc -AccessRight full 
$cim = New-CimSession -ComputerName "testest123"
Revoke-SmbShareAccess -Name qshare -AccountName "Alla" -Force -CimSession $cim
}
