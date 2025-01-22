FROM php:7.4-apache

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

RUN apt-get update && apt-get install -y \
    unzip \
    zip \
 && rm -rf /var/lib/apt/lists/* \
 && a2enmod proxy \
 && a2enmod proxy_http
COPY ./deploy/my-proxy.conf /etc/apache2/sites-available/000-default.conf

COPY ./deploy/ /var/www/html

WORKDIR /var/www/html/api

RUN npm install \
 && npm install pm2 -g \
 && env PATH=$PATH:/usr/local/lib/node_modules/pm2/bin/pm2 \
 && npm run build
 && npm run start:dev

# Exposer le port 80 pour permettre les connexions entrantes
EXPOSE 80

# Définir l'entrée de l'application
# CMD pm2 start ./dist/main.js && apache2-foreground
CMD npm run start:dev