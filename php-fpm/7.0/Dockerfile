FROM php:7.0-fpm

# TM customization
RUN apt-get update \
  && apt-get install -y libmcrypt-dev zlib1g-dev \
  && php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
  && yes '' | pecl install apcu \
	&& docker-php-ext-install mcrypt mbstring zip pdo_mysql \
  && docker-php-ext-enable apcu

COPY php.ini ${PHP_INI_DIR}/php.ini
COPY fpm-status.conf /usr/local/etc/php-fpm.d/fpm-status.conf

EXPOSE 9000
WORKDIR /var/www/html
