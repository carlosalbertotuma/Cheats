# Study Project for ( DCPT - Desec Certified Penetration Tester ) 
By Carlos Tuma - Bl4dsc4n

# Guia atualizado de estudo, para certificação DCPT
                                          
Obs: O guia tem como principal objetivo, dar um melhor direcionamento há estudantes de segurança ofensiva que buscam certificações, o guia está sendo elaborado com direcionamento para DCPT, mais serve como base para as certificação CEH. 

![bl4dsc4n](https://user-images.githubusercontent.com/13341724/162857229-8071bf97-9689-45fb-9692-7a55b40a4b3e.jpeg)



# Onerline
 
Crawl - utilizei o wget2 mas rapido que o wget.
 
wget2 --spider -rH vulnweb.com | grep "Adding URL:" | cut -d " " -f 3 | egrep "http|https"

pode ser usado mas um grep no final filtrando apenas o que tiver relacao ao domínio.

wget2 --spider -rH vulnweb.com | grep "Adding URL:" | cut -d " " -f 3 | egrep "http|https" | grep "dominio"

podemos salvar em um arquivo

wget2 --spider -rH vulnweb.com | grep "Adding URL:" | cut -d " " -f 3 | egrep "http|https" | tee -a arq.txt


OSINT web.archive.org

curl -sk "http://web.archive.org/cdx/search/cdx?url=*.vulnweb.com/*&output=txt&fl=original" | sort -u
