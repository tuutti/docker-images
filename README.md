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

- composer 2

## Development

### Building

- `make build TAG=7.4`

### Pushing

- `make push TAG=7.4`
