# Étape 1 : Installer PHP et Apache
FROM php:7.4-apache AS php-apache

ENV COMPOSER_ALLOW_SUPERUSER=1

# Copier les fichiers PHP (par exemple, pour une API existante)
COPY ./deploy/ /var/www/html

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    zip && \
    curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Exposer le port Apache
EXPOSE 80

# Étape 2 : Ajouter Node.js et NestJS
FROM node:18 AS nestjs

# Copier les fichiers NestJS
COPY ./nestjs-app/ /usr/src/app

WORKDIR /usr/src/app

# Installer les dépendances et compiler le projet NestJS
RUN npm install && npm run build

# Exposer le port du serveur NestJS
EXPOSE 3000

# Étape 3 : Lancer les deux serveurs avec supervisord
FROM php:7.4-apache

# Copier les fichiers des étapes précédentes
COPY --from=php-apache /var/www/html /var/www/html
COPY --from=nestjs /usr/src/app /usr/src/app

# Installer supervisord pour gérer les deux serveurs
RUN apt-get update && apt-get install -y supervisor && mkdir -p /var/log/supervisor

# Ajouter le fichier de configuration supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Commande de lancement
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
