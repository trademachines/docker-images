FROM php:7.0-fpm

# TM customization
RUN apt-get update \
	&& apt-get install -y libmcrypt-dev \
  && php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
	&& docker-php-ext-install mcrypt

COPY php.ini ${PHP_INI_DIR}/php.ini

EXPOSE 9000
WORKDIR /var/www/html
