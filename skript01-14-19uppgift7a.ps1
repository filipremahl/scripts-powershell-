New-item -Path c:\temp\fel.html -ItemType File

$1 = "Totalt antal Warningar, error från system loggen" 
$2 = (Get-EventLog system | where-object {$_.EntryType -NE "Information"}).count

$3 = "Hur många Warningar, error har tillkommit de sista 24 timmarna"
$4 = (get-eventlog system -after (Get-Date).AddHours(-24) | where-object {$_.EntryType -NE "Information"}).count

# Är det mer än 10 nya Warningar, error meddelanden, skriv  ut ett varningsmeddelande.
$var = (Get-EventLog system | where-object {$_.EntryType -NE "Information"} | Sort-Object -Unique | Select-Object -Last 100).count
if ( $var -gt 10 ) { $7 = "Det finns fler än 10 error och warnings meddelanden" }

# Presentera en formaterad webbsida med resultatet
$body = @"
$1<br>
$2<br>
$3<br>
$4<br>
$7<br>
"@

# Vilka är de 100 sista unika Warningar, error meddelande.
Get-EventLog system | where-object {$_.EntryType -NE "Information"} | Sort-Object -Unique | Select-Object -Last 100 | ConvertTo-Html -body $body| Out-File c:/temp/fel.html
