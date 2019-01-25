New-Item -Path C:\Users\qshare\resurser\ -ItemType Directory
New-SmbShare -Name resurser -Path C:\Users\qshare\resurser

New-Item -Path C:\Users\qshare\gemensam\ -ItemType Directory
New-SmbShare -Name gemensam -Path C:\Users\qshare\gemensam\
