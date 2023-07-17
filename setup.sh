#!/bin/bash

echo "Copiando env"
cp .env.example .env

echo "Composer install"
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer install --ignore-platform-reqs

echo "Subindo containers"
./vendor/bin/sail up -d

echo "Dando permissões a pasta Storage"
sudo chmod o+w ./storage/ -R
sudo chmod -R gu+w storage
sudo chmod -R guo+w storage

echo "Gerando chave"
./vendor/bin/sail php artisan key:generate

echo "Rodando migrate"
./vendor/bin/sail php artisan migrate

echo "Iniciando Horizon"
./vendor/bin/sail php artisan horizon