# Laravel horizon docker

Instalação feita no ambiente Ubuntu 20.04, utilizando Docker Desktop configurado com WSL2
## Configs

- Laravel Version 10.15.0.
- PHP Version 8.1.21
- Composer Version 2.5.8
- Docker Version 20.10.6


## Instalação
Execute o arquivo `setup.sh` na raiz do projeto


## Horizon
Acesseo container do Laravel  
`docker exec -it rdv-ocr_laravel bash`  

Rode o comando para executar a fila  
`php artisan horizon`  

Visualize o painel do Horizon em:  
`http://localhost/horizon/dashboard`
