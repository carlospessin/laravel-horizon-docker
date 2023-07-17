# Laravel horizon docker

Instalação feita no ambiente Ubuntu 18.04, utilizando Docker Desktop configurado com WSL2
## Configs

- Laravel Version 10.15.0
- PHP Version 8.2.8
- Composer Version 2.5.8
- Docker Version 20.10.6

## Instalação
Execute o arquivo `setup.sh` na raiz do projeto

Por padrão, a instalação já iniciará a fila do Horizon

## Horizon

Rode o comando para executar a fila  
`./vendor/bin/sail php artisan horizon`  

Visualize o painel do Horizon em:  
`http://localhost/horizon/dashboard`  

Limpe os dados do Redis enviando um GET na rota `clear-redis`

## Utils

Em vez de digitar repetidamente vendor/bin/sail para executar comandos do Sail, você pode configurar um alias de shell que permita executar os comandos do Sail com mais facilidade:

`alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'`

Adicione isso ao arquivo de configuração do seu shell em seu diretório HOME, no ~/.zshrc ou ~/.bashrc, e depois reinicie o seu shell.
