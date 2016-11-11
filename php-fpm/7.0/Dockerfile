FROM php:7.0-fpm

# TM customization
RUN apt-get update \
	&& apt-get install -y libmcrypt-dev \
  && php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
	&& docker-php-ext-install mcrypt \
  && echo "pm.status_path = /fpm-status"

COPY php.ini ${PHP_INI_DIR}/php.ini
COPY fpm-status.conf /usr/local/etc/php-fpm.d/fpm-status.conf


EXPOSE 9000
WORKDIR /var/www/html
