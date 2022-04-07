# AdGuardHome - Windows service installer
This solution works thanks to the [nssm](https://nssm.cc/) utility and registers AdGuard Home as a service in Windows.

### Minimum System Requirements:
Windows 7 or Windows Server 2008

### Installation
1. Run the installer as an administrator.
2. Accept the license agreement.
3. Run the install_service script as an administrator.
4. Go to the address http://127.0.0.1:3000 to configure DNS.

### Uninstallation
1. Run the uninstall_service script as an administrator.
2. Restart the PC.

### Reset Configuration
delete the file "C:\Windows\AdguardHome\AdGuardHome.yaml"\
and the folder "C:\Windows\AdguardHome\data\filters"
