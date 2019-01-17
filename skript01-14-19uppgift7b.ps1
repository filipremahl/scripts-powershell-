$1 = history | Sort-Object -Property CommandLine -Unique | Sort-Object -Property Id
New-Item -path C:\temp\history.txt
Clear-Content -path C:\temp\history.txt
Clear-Content -path C:\temp\history.html

Add-Content -path C:\temp\history.txt -value $1
Copy-Item -Path C:\temp\history.txt -NewName "C:\temp\history$((get-date).tostring("MMddyyyy")).txt"

# Jämför dagens historik med gårdagens, alla kommandon som kördes båda dagarna kommer att visas
$2 = Compare-Object -ReferenceObject "C:\temp\history$((get-date).tostring("MMddyyyy")).txt" -DifferenceObject "C:\temp\history$((get-date).AddDays(-1).tostring("MMddyyyy")).txt"

# Presenterar allt i HTML format
$body = @"
$1<br>
$2<br>
"@
ConvertTo-Html -body $1| Out-File c:/temp/history.html


#$speechy = New-Object –ComObject SAPI.SPVoice;
#$speechy.Speak(“Command Complete”)
#Eject