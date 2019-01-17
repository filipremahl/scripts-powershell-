New-item -Path c:\temp\fel.html -ItemType File
ConvertTo-Html -Body "Totalt antal Warningar, error från system loggen" | Out-File c:/temp/fel.html
ConvertTo-Html -Body (Get-EventLog system | where-object {$_.EntryType -NE "Information"}).count | Out-File c:/temp/fel.html
ConvertTo-Html -Body "Hur många Warningar, error har tillkommit de sista 24 timmarna" | Out-File c:/temp/fel.html

ConvertTo-Html -Body (get-eventlog system -after (Get-Date).AddHours(-24) | where-object {$_.EntryType -NE "Information"}).count
#Get-EventLog system | where-object {$_.EntryType -NE "Information"} | Sort-Object -Unique | Select-Object -Last 100 | ConvertTo-Html | Out-File c:/temp/fel.html
$var = (Get-EventLog system | where-object {$_.EntryType -NE "Information"} | Sort-Object -Unique | Select-Object -Last 100).count
if ( $var -gt 10 ) { ConvertTo-Html -Body "Det finns fler än 10 error och warnings meddelanden" | Out-File c:/temp/fel.html }