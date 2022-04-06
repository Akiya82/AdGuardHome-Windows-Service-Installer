@echo off
chcp 65001
title AdGuard Home service installer
CLS

net session >nul 2>&1
if not errorLevel 0 (
  echo.
  echo  Error: You need to run the script as an administrator.
  echo.
  echo  Aborting... & pause & goto end
)

if "%PROCESSOR_ARCHITECTURE%" NEQ "AMD64" (
  echo.
  echo  Error: This version of Adguard is not designed for 32 bit systems.
  echo.
  echo  Aborting... & pause & goto end
)

CLS
echo.
echo  GPL-3.0 License - AdGuardHome
echo.
echo  The latest Version of License AdGuardHome is licensed unter can be found here: https://github.com/AdguardTeam/AdGuardHome/blob/master/LICENSE.txt
echo.
echo  Do you accept this Licenses?
echo.
echo  1. No
echo  2. Yes
echo.
CHOICE /C 12 /M " Selection: "
if errorLevel 2 goto 1
if errorLevel 1 echo  Aborting... & pause & goto end

:1
cd %windir%/AdguardHome
copy /y nssm.exe %windir%
if errorLevel 0 goto 2

:2
echo "Installing the service..."
nssm install adguardhome "%windir%\AdguardHome\AdGuardHome.exe"
nssm set adguardhome AppDirectory "%windir%\AdguardHome"
nssm set adguardhome DisplayName "Adguard Home DNS-server(x64)"
nssm set adguardhome Description "The service responsible for the operation of the Adguard DNS server."
nssm set adguardhome Start SERVICE_AUTO_START
nssm set adguardhome AppThrottle 15000
if errorLevel 0 goto 3

:3
echo "Starting the service..."
nssm start adguardhome 
echo "You can configure the DNS server by going to: http://127.0.0.1:3000"

pause