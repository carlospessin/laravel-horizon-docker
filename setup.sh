#!/bin/bash

# Atualiza os pacotes
sudo apt update

# Navega para o diretório home
cd ~

# Baixa o instalador do Composer
sudo curl -sS https://getcomposer.org/installer -o composer-setup.php

# Verifica a integridade do instalador do Composer
HASH=$(curl -sS https://composer.github.io/installer.sig)
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Adiciona o repositório PPA do PHP
sudo add-apt-repository ppa:ondrej/php

# Instala o PHP 8.1
sudo apt install php8.1

# Instala as extensões do PHP necessárias
sudo apt install php8.1-mysql
sudo apt install php8.1-xml
sudo apt install php8.1-curl

# Executa o comando composer update
composer update

# Define as permissões corretas para o Composer
sudo chmod 755 $HOME/.cache/composer/composer-temp.phar
sudo mv $HOME/.cache/composer/composer-temp.phar /usr/local/bin/composer

# Executa o comando artisan para gerar a chave
./vendor/bin/sail php artisan key:generate

# Inicia o ambiente de desenvolvimento com o Sail
./vendor/bin/sail up -d
