ARG BASE_IMAGE_TAG
FROM php:${BASE_IMAGE_TAG}

RUN apt-get update

# Install PHP and composer dependencies
RUN apt-get install git zip libpng-dev mysql-client -yqq

# Install needed extensions
RUN docker-php-ext-install gd pdo_mysql zip

# Install Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install drush
RUN composer global require "drush/drush:9.0.*"
