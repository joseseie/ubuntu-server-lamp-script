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
