New-Item -Path c:\temp -ItemType Directory
New-Item -Path c:\temp\test.txt -ItemType File
Add-Content c:\temp\test.txt (Get-Date)
Add-Content c:\temp\test.txt "Välkommen till Nackademin"
Clear-Content C:\temp\test.txt
Add-Content C:\temp\test.txt "Välkommen till Nackademin"
Add-Content C:\temp\test.txt (Get-Date)