FROM php:8.2-fpm

RUN apt-get update \
    && apt-get install -y \
    libpq-dev \
    zlib1g-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html

COPY . .

CMD ["php-fpm"]
