echo "Copiando env"
cp .env.example .env

echo "Rodando composer"
composer update

echo "Instalando containers"
./vendor/bin/sail up -d