FROM php:8.1-fpm

# Arguments defined in docker-compose.yml
ARG user=trade
ARG uid=1000

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zlib1g-dev \
    libwebp-dev \
    libjpeg-dev \
    libxpm-dev \
    zip \
    unzip \
    libmagickwand-dev --no-install-recommends

# Install PHP extensions
RUN apt-get install -y libpq-dev libcurl4-openssl-dev pkg-config libssl-dev \
    && docker-php-ext-install pdo mbstring exif pcntl bcmath gd sockets

RUN pecl install mysql && docker-php-ext-enable mysql

RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN pecl install redis && docker-php-ext-enable redis
 
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www

USER $user
