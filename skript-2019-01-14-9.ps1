#Hämtar EventIT 
$1 = (Get-EventLog security | where {$_."EventID" -like "4624"}).count
Write-Host Antal lyckade inloggningar: $1

$2 = (Get-EventLog security | where {$_."message" -like "*Logon Type:		2*"}).count
Write-Host Antal inloggningar från tangentbord: $2

$3 = (Get-EventLog security | where {$_."message" -like "*Logon Type:		3*"}).count
Write-Host Antal inloggningar från nätverk: $3

$4 = (Get-EventLog security | where {$_."EventID" -like "4625"}).count
Write-Host "Antal misslyckade inloggnignar: $4" -fore red

#Kollar om backupfilen finns eller inte innan den skapar backupfilen.
if (-not (Test-Path C:\temp\loginhistory.txt)) { New-Item -Path C:\temp\loginhistory.txt }
Add-Content -Path C:\temp\loginhistory.txt "Antal lyckade inloggningar: $1"
Add-Content -Path C:\temp\loginhistory.tx "Antal inloggningar från tangentbord: $2"
Add-Content -Path C:\temp\loginhistory.tx "Antal inloggningar från nätverk: $3"
Add-Content -Path C:\temp\loginhistory.tx "Antal misslyckade inloggnignar: $4"
