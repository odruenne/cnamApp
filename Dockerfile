# FROM php:7.4-apache

# RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
#     && apt-get install -y nodejs

# RUN apt-get update && apt-get install -y \
#     unzip \
#     zip \
#  && rm -rf /var/lib/apt/lists/* \
#  && a2enmod proxy \
#  && a2enmod proxy_http
# COPY ./deploy/my-proxy.conf /etc/apache2/sites-available/000-default.conf

# COPY ./deploy/ /var/www/html

# WORKDIR /var/www/html/api

# RUN npm install \
#  && npm install pm2 -g \
#  && env PATH=$PATH:/usr/local/lib/node_modules/pm2/bin/pm2 \
#  && npm run build

# # Exposer le port 80 pour permettre les connexions entrantes
# EXPOSE 80

# # Définir l'entrée de l'application
# CMD pm2 start ./dist/main.js && apache2-foreground
# Utilisation de l'image PHP avec Apache
FROM php:7.4-apache

# Installation de Node.js et des outils nécessaires
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get update && apt-get install -y \
    unzip \
    zip \
 && rm -rf /var/lib/apt/lists/* \
 && a2enmod proxy \
 && a2enmod proxy_http

# Copie de la configuration du proxy Apache
COPY ./deploy/my-proxy.conf /etc/apache2/sites-available/000-default.conf

# Copie de l'application
COPY ./deploy/ /var/www/html

# Déplacement vers le répertoire de l'API
WORKDIR /var/www/html/api

# Installation des dépendances Node.js
RUN npm install \
 && npm install pm2 -g \
 && npm run build

# Exposer les ports nécessaires
EXPOSE 80
EXPOSE 3000

# Lancement de NestJS via PM2 et Apache en parallèle
CMD pm2 start ./dist/main.js --name nest-app && apache2-foreground
