FROM php:8.4-fpm-alpine

RUN apk update && \
    apk add --no-cache build-base autoconf \ 
    && apk add --update linux-headers \
    libpq-dev \
    postgresql-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql opcache -j$(nproc) \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug 

RUN apk del build-base autoconf \
    && apk cache clean

