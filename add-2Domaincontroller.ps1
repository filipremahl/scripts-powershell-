install-windowsfeature AD-Domain-Services

Install-ADDSDomainController -CreateDnsDelegation:$false -DatabasePath 'C:\Windows\NTDS' -DomainName 'filipsdomain.com' -InstallDns:$true -LogPath 'C:\Windows\NTDS' -NoGlobalCatalog:$false -SiteName 'Default-First-Site-Name' -SysvolPath 'C:\Windows\SYSVOL' -NoRebootOnCompletion:$true -Force:$true
Import-Module Servermanager
Install-WindowsFeature -Name RSAT
