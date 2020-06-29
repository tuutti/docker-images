ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG}

# Install PHP and composer dependencies
RUN apt-get update && apt-get install git libzip-dev zip libpng-dev mariadb-client -yqq

# Install needed extensions
RUN docker-php-ext-install gd pdo_mysql zip bcmath

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install drush
RUN composer global require "drush/drush:9.0.*"
