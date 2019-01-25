# scripts-powershell

HyperV-labb: Skapa Hyper V Labbmiljö med scripts
_________________________________________________________________________

With these scirpts you can create a whole domain enviroment:

Skapa en miljö bestående av:

- 2st Windows servrar i rollen domän kontroller.

- 2st Windows servrar i rollen member servers..

- Skapa 20 st användare

- Skapa fildelningsområden (Shares folders) på alla servrar:
Gemensam
Resurser
Privat för varje användare
__________________________________________________________________________

STEP1: Run "New-NATswitch.psm1" to create a virtual switch which we will use for all VMs.
STEP2: Run "New-labVM.psm1" to create new virtual machines configed with ipaddress, hostname, dns, gateway etc.
STEP3: Run "Install-DC-Forest.ps1" to create the first domaincontroller in a new forest (this has to be run locally).
STEP4: Run "join-domain.ps1" to join new VMs to our new domain (this can be run remotly).
STEP5: Run "New-DC-Domain" to add a domaincontroller to an existing forest (child site).
STEP6: Run "New-ADuser-bulkimport.ps1" to add users with an .csv file.
STEP7: Run "New-Private-fileshare.ps1" and "New-standard-fileshare.ps1" to create fileshares.
