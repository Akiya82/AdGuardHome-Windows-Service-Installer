@echo off
chcp 65001
cd "%windir%/AdguardHome"
CLR

echo  Marking the service for deletion...
nssm remove adguardhome confirm
sc delete adguardhome 

echo  You can delete the Adguard Home folder and restart the PC.
pause