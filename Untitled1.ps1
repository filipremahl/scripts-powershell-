New-Item -Path c:\temp -ItemType Directory
New-Item -Path c:\temp\test.txt -ItemType File
Add-Content c:\temp\test.txt (Get-Date)