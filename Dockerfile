# Defina qual distro do linux vc quer usar
FROM ubuntu:latest


# Instale as dependencias do SISTEMA OPERACIONAL
# Exemplo de como seria no ubuntu: RUN apt update && apt install -y python3 python3-pip libpq-dev
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y python3 python3-dev
RUN apt-get install -y python3-pip
RUN pip3 install pip setuptools
RUN pip3 install wheel
RUN pip3 install psutil
RUN apt-get -y install wget
RUN apt install -y sudo 
RUN sudo apt-get install unzip
RUN usermod -aG sudo root



WORKDIR /app
COPY . /app


#Instalção do PostgreSql
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_USER=postgres
RUN apt -y install  libpq-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-client postgresql-contrib
RUN sudo su postgres


# Sua imagem deve ter o python 3.8+ instalado e o pip
RUN pip3 install -r requirements.txt

#Criação do Banco de Dados
RUN wget -q https://github.com/electrum/tpch-dbgen/archive/32f1c1b92d1664dba542e927d23d86ffa57aa253.zip -O tpch_pgsql/tpch-dbgen.zip
RUN unzip -q tpch_pgsql/tpch-dbgen.zip && mv tpch-dbgen-32f1c1b92d1664dba542e927d23d86ffa57aa253 tpch_pgsql/tpch-dbgen && rm tpch_pgsql/tpch-dbgen.zip
RUN chmod +x init.sh
RUN sh  init.sh
EXPOSE 5432