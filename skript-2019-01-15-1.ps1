$cert = New-SelfSignedCertificate -Subject "My Code Signing Certificate” -Type CodeSigningCert -CertStoreLocation cert:\LocalMachine\My
Export-Certificate -Cert $cert -FilePath "C:\temp\Mitt-rootCA.crt"
Import-Certificate -CertStoreLocation 'Cert:\LocalMachine\Root' -FilePath "C:\temp\Mitt-rootCA.crt"


New-Item -Path C:\temp\CAscript.ps1
Add-Content -Path C:\temp\CAscript.ps1 "Write-Host hello"
Set-AuthenticodeSignature c:\temp\CAscript.ps1 @(Get-ChildItem cert:\LocalMachine\My -codesign)[0]
