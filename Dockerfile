# Étape 1 : Utiliser l'image de base PHP avec Apache
FROM php:7.4-apache

# Étape 2 : Installer Node.js, npm et PM2
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    unzip \
    zip \
 && rm -rf /var/lib/apt/lists/* \
 && a2enmod proxy \
 && a2enmod proxy_http

# Étape 3 : Configurer Apache pour agir comme proxy
COPY ./deploy/my-proxy.conf /etc/apache2/sites-available/000-default.conf

# Étape 4 : Copier les fichiers de l'application
COPY ./deploy/ /var/www/html

# Étape 5 : Installer les dépendances et construire l'application NestJS
WORKDIR /var/www/html/api

RUN npm install \
 && npm run build \
 && npm install pm2 -g

# Étape 6 : Exposer les ports
EXPOSE 80        # Apache
EXPOSE 3000      # NestJS

# Étape 7 : Démarrer les services
CMD pm2 start dist/main.js && apache2-foreground
