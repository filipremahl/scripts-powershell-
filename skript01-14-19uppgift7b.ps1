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
<pre>
$1<br>
$2
</pre>
"@
ConvertTo-Html -body $body| Out-File c:/temp/history.html


$speechy = New-Object –ComObject SAPI.SPVoice;
$speechy.Speak(“Command Complete”)
$Eject = New-Object -ComObject "Shell.Application"
$Eject.Namespace(17).Items() | 
    Where-Object { $_.Type -eq "CD Drive" } | 
        foreach { $_.InvokeVerb("Eject") }

#$From = "EmailAddress@gmail.com"
#$To = "SomeOtherAddress@whatever.com"
#$Cc = "AThirdUser@somewhere.com"
#$Attachment = "C:\users\Username\Documents\SomeTextFile.txt"
#$Subject = "Here's the Email Subject"
#$Body = "This is what I want to say"
#$SMTPServer = "smtp.gmail.com"
#$SMTPPort = "587"
#Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) -Attachments $Attachment –DeliveryNotificationOption OnSuccess