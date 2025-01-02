# Utiliser une image de base avec PHP et Apache pour servir le front-end Angular
FROM php:7.4-apache

# Installer les dépendances pour NestJS (Node.js, npm, PM2)
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    zip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite headers \
    && apt-get install -y \
    && npm install -g pm2 \
    && npm install -g @nestjs/cli \
    && npm install -g typescript

# Copier le code source Angular et NestJS
COPY ./deploy/ /var/www/html/
COPY ./deploy/api/ /var/www/html/api/

# Travailler dans le dossier contenant le front-end Angular
WORKDIR /var/www/html

# Installer les dépendances et construire le front-end Angular
RUN cd /var/www/html && npm install && npm run build --prod

# Travailler dans le dossier contenant le back-end NestJS
WORKDIR /var/www/html/api

# Installer les dépendances pour le back-end NestJS
RUN npm install

# Exposer les ports nécessaires
EXPOSE 80        
EXPOSE 3000      

# Lancer NestJS avec PM2 et Apache pour servir Angular
CMD pm2 start src/main.ts && apache2-foreground
