FROM php:5.5-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/composer
ENV BUILD_PACKAGES='libmemcached-dev libcurl4-openssl-dev libmcrypt-dev zlib1g-dev libicu-dev g++ libfreetype6-dev libpng12-dev pkg-config libssl-dev'

RUN apt-get update \
    && apt-get install -yy git $BUILD_PACKAGES \
    && php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
    && php composer-setup.php \
    && rm composer-setup.php \
    && mv composer.phar /usr/local/bin/composer \
    && yes '' | pecl install memcache \
    && yes '' | pecl install mongo \
    && docker-php-ext-enable memcache mongo \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd \
    && docker-php-ext-install opcache curl intl gd mcrypt zip pdo_mysql \
    && apt-get remove --purge -y $BUILD_PACKAGES && rm -rf /var/lib/apt/lists/*

COPY php.ini ${PHP_INI_DIR}/php.ini
COPY zz-trademachines.conf /usr/local/etc/php-fpm.d/zz-trademachines.conf

EXPOSE 9000
WORKDIR /var/www/html
