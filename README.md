# General use Docker images for various projects

## Drupal CI docker image

Contains Docker images for testing Drupal in CI environments.

See ci/drupal/Dockerfile.

Available PHP versions: 8.1, 8.0, 7.4:

ghcr.io/tuutti/drupal-php-docker:8.1
ghcr.io/tuutti/drupal-php-docker:8.0
ghcr.io/tuutti/drupal-php-docker:7.4 (deprecated, left for legacy reasons)

All containers include packages necessary to run all Drupal tests (including FunctionalJavascript tests using chromium-driver).

### Development

Build:
- `make build TAG=8.1 PHP_VERSION=8.1`
Push:
- `make push TAG=8.1 PHP_VERSION=8.1`

### Included packages
- git
- sqlite
- make
- bash
- jq
- mariadb-client
- chromium-driver

### PHP extensions

- php-gd
- php-pdo_mysql
- pphp-pdo_sqlite
- php-zip
- opcache
- php-bcmath
- php-apcu

### PHP libraries

- composer 2.2
- drush launcher
