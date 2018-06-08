#!/bin/bash
# O script deve ser executado pelo utilizador root
# Prepara o ambiente do servidor
# Versao 08.06.18
# Ultima actualizacao 08.06.18

# Verificando se eh o utilizador root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo apt-get update

# Instalando apache2
sudo apt-get install apache2

# Lendo o server domain ou ip
read -p "insira o dominio ou ip do servidor: " servername

# Adicionando informacoes do servidor
echo "ServerName $servername" >> /etc/apache2/apache2.conf

# Reiniciando apache
sudo systemctl restart apache2

# Permitindo todo o trafego ao APache full
sudo ufw allow in "Apache Full"

# Instalacao do mysql
sudo apt-get install mysql-server

# Instalacao de php
apt-get update && apt-get upgrade

# Instalando softwares de 3ros para a instalacao do php 7.2
apt-get install python-software-properties
add-apt-repository ppa:ondrej/php
apt-get update

# Instalando o php 7.2
apt-get install php7.2

# Instalando os modulos
apt-get install php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml



