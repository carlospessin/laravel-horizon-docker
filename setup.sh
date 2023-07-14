#!/bin/bash

# Dá as permissões para a pasta storage
echo "Dando permissões a pasta Storage"
sudo chmod o+w ./storage/ -R
sudo chmod -R gu+w storage
sudo chmod -R guo+w storage

# Executa os containers
echo "Subindo Containers"
docker compose up -d

echo "Aguardando subir o container do Laravel"
for i in {5..1}; do
    echo -ne "Aguarde... $i segundo(s)\r"
    sleep 1
done

# Copia o env
echo "Copiando env"
cp .env.example .env

# Executa o comando artisan para gerar a chave
echo "Rodando Composer"
docker exec rdv-ocr_laravel /bin/bash -c "composer install"

echo "Rodando Composer"
docker exec rdv-ocr_laravel /bin/bash -c "php artisan key:generate"

echo "Rodando Migrations"
docker exec rdv-ocr_laravel /bin/bash -c "php artisan migrate"


