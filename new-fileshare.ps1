New-Item -Path C:\Users\qshare\resurser\ -ItemType Directory
New-SmbShare -Name resurser -Path C:\Users\qshare\resurser
Grant-SmbShareAccess -Name resurser -AccountName "Alla" -AccessRight full

New-Item -Path C:\Users\qshare\gemensam\ -ItemType Directory
New-SmbShare -Name gemensam -Path C:\Users\qshare\gemensam\
Grant-SmbShareAccess -Name gemensam -AccountName "Alla" -AccessRight full
