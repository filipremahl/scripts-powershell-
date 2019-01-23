install-windowsfeature AD-Domain-Services

Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath “C:\Windows\NTDS” -DomainMode “Win2012R2” -DomainName “Filipsdomain.com” -DomainNetbiosName “FilipsDOMAIN” -ForestMode “Win2012R2” -InstallDns:$true -LogPath “C:\Windows\NTDS” -NoRebootOnCompletion:$false -SysvolPath “C:\Windows\SYSVOL” -Force:$true 
Import-Module Servermanager
Install-WindowsFeature -Name RSAT
