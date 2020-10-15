# drupal-php-docker

Contains Docker images for testing Drupal.

## Included packages

- git
- libzip-dev
- zip
- libpng-dev
- mariadb-client
- chromium-driver

## PHP extensions

- php-gd
- php-pdo
- php-zip
- php-bcmath

## PHP libraries

- drush 9.x (PHP 7.1-7.3), 10.x (PHP 7.4)
- composer

## Development

### Building

- `make build TAG=7.4`

### Pushing

- `make push TAG=7.4`
