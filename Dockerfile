FROM php:7.4-apache

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./deploy/ /var/www/html

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    zip && \
    curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

EXPOSE 80
CMD ["apache2-foreground"]