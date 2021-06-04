ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG}
ARG DRUSH

# Install PHP and composer dependencies
RUN apt-get update -yqq && apt-get install git libzip-dev zip libpng-dev mariadb-client chromium-driver jq -yqq

# Install needed extensions
RUN docker-php-ext-install gd pdo_mysql zip bcmath

RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer self-update --2

# Install drush
RUN composer global require "drush/drush:${DRUSH}.*"

ENV PATH "$PATH:/root/.config/composer/vendor/bin"

