FROM trademachines/php-fpm:5.5

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY php.ini ${PHP_INI_DIR}/php.ini
