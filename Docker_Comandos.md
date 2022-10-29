# O que é o Docker ?

Resumidamente Docker é uma forma de virtualizar aplicações no conceito de “containers”, dividido por camadas, a onde a imagem possui permissão de leitura e os containers recebem uma pequena camada de leitura e escrita.

Guia de referencia do docker

https://docs.docker.com/engine/reference/

https://docs.docker.com/engine/reference/commandline/docker/

#### Principais comandos #######

Instalar o docker no linux
# apt install docker.io -y

Help
# docker --help ou docker comando* --help

Baixando uma imagem chamada ubuntu do repositório dockerhub.
# docker pull ubuntu

Iniciando um container a partir da imagem ubuntu, com opção –it modo interativo –d background, lembrando que toda vez que chamar a opção run, vai ser criado um novo container com nome e ID diferentes. 
# docker run -it -d ubuntu  

Stopando um container em execução, (pode ser utilizado apenas 2 primeiras letras do ID do container) 
# docker stop idcontainer 

Start um container em backgroud
# docker start idcontainer 

O container pode ser executado em modo -i interativo, usado para anexar o STDIN do contêiner, -a usado para anexar stdout/STDERR e sinais de avanço.

# docker start -a -i idcontainer 

Visualiza container que estejam em execução, podemos utilizar o comando "container ls" ou apenas "ps" 
# docker ps

# docker container ls  

Visualizar todos os container criados
# docker ps –a  

# docker container ls -a

Para visualiza ID dos container criados
# docker ps –q  

# docker container ls -q

Para visualiza ID dos container em execução
# docker ps -a –q  

# docker container ls -a -q

Para visualiza imagens baixadas
# docker images 

ou

# docker image ls

Executando comandos no container, utilizando o comando exec , lembrando que no docker ao criar um container RUN, se não for passado a opção --name nomecontainer, ele recebera um nome aleatorio, verifique o nome atribuido ao container para executar o exec, a opção exec o container precisa está startado.
# docker exec –it ubuntu bash 

Opção Run inicia um novo container, lembrando que todas as vezes que for chamado o Run, ira criar um novo container com nome e id diferentes, a opção –P maiúscula cria uma rota para rede bridger entre os container.
# docker run –it –d –P ubuntu 

Mapeamento de porta, opção –p minúsculo mapeia uma porta 12345 local para porta do container 80
# docker run –it –d –p 12345:80 ubuntu  

Criando uma rede para comunicação dos container, criar uma rede bridge é necessário quando queremos chamar, os container pelo nome não pelo IP, como se fosse DNS.
# docker network create --drive bridge minha-rede  

Criando um container, ligando a rede previamente criada.
# docker run -it --name meuconteiner --network minha-rede ubuntu

Verificar redes que o docker possui registradas
# docker network ls 

Criando volumes –v ,  cria um volume em home na maquina local, encaminhando para /var/www no container. 
Obs: arquivos que não estiver em volume, se o container for destruido, perdera todos os arquivos junto.
# docker run -it -v “/home/bl4dsc4n/” -w "/var/www“ # 

Depois que criamos um container a partir de uma imagem, podemos verificar as alterações feita no container com a opção "diff".

# docker diff IDcontainer

Renomeando o nome atribuido ao container

# docker rename stoic_mayer novonome

Criando uma nova imagem a partir de um container modificado, 1.0 é a tag utilizada no caso exemplifiquei para versao 1.0.

# docker container commit nomecontainer imagemNova:1.0

Podemos inspecionar um container criado.

# docker inspect IDcontainer

Podemos remover um container, a onde vai destuir o container criado.

# docker rm IDcontainer

Podemos salvar uma imagem por padrao em um arquivo "tar" das seguintes formas, direcionando para um novo arquivo utilizando ">".

# docker save ImagemParaSalvar > arquivoSalvo.tar

ou

# docker save --output arquivoSalvo.tar ImagemParaSalvar

ou 

# docker save -o arquivoSalvo.tar ImagemParaSalvar

Podemos direcionar para o gzip

# docker save ImagemParaSalvar | gzip > arquivoSalvo.tar.gz
Podemos carregar uma imagem a partir de um arquivo

# docker load --input arquivoSalvo.tar

Também podemos direcionar para o "load" "<"

# docker load < arquivoSalvo.tar.gz

Para remover uma imagem do nosso repositorio local utilizamos a opcao "rmi"

# docker rmi imageParaRemover
