# Laravel horizon docker

Instalação feita no ambiente
## Configs

- Laravel Version 10.15.0.
- PHP Version 8.1.21
- Composer Version 2.5.8


Composer:
`sudo apt update`  
`cd ~`  
`sudo curl -sS https://getcomposer.org/installer -o composer-setup.php`  
`HASH=`curl -sS https://composer.github.io/installer.sig``  
`echo $HASH`  
`php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"`   
`sudo add-apt-repository ppa:ondrej/php`  
`sudo apt install php8.1`  
`sudo apt install php8.1-mysql`  
`composer updatee`  
`cd cpjunior/.cache/composer`  
`sudo chmod 755 composer-temp.phar`  
`sudo mv composer-temp.phar /usr/local/bin/composer`  
`sudo apt install php8.1-xml`  
`sudo apt install php8.1-curl`  
`./vendor/bin/sail php artisan key:generate`  
`./vendor/bin/sail up -d`  


## Horizon
Começe o serviço com o comando:  
`./vendor/bin/sail artisan horizon`  
`http://localhost/horizon/dashboard`
