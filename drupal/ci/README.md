# Drupal CI image

Available PHP versions: `8.2`, `8.1`:

- `ghcr.io/tuutti/drupal-php-docker:8.2`
- `ghcr.io/tuutti/drupal-php-docker:8.1`

## Environment variables

- `SIMPLETEST_DB=mysql://drupal:drupal@db:3306/drupal`
- `SIMPLETEST_BASE_URL=http://127.0.0.1:8888`
- `COMPOSER_HOME=/tmp/.composer`: The composer home is overridden to mitigate permission issues
- `DRUSH_SECURITY_ADVISORIES_URL`: This is used by `drush pm:security` command to scan project for security updates
- `COMPOSER_MIRROR_PATH_REPOS=1`: Individual module tests use `composer config repositories N $GITHUB_WORKSPACE && composer require drupal/$MODULE_NAME` to symlink module's codebase from $GITHUB_WORKSPACE to modules/contrib folder. PHPUnit seems to report an incorrect test coverage if the test folder is a symlink. This setting changes composer to mirror the content instead of symlinking it.

## Development

### Requirements

- [GoogleContainerTools/container-structure-test](https://github.com/GoogleContainerTools/container-structure-test)

### Building

To build a specific image, call:

- `8.1` tag: `make build-php81`

To run built image locally:

- `8.1` tag: `make run-php81`

### Testing

We use [GoogleContainerTools/container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) to test images. See [tests/](tests/) for available tests.

Running tests will always rebuild the image first.

- Run tests against `8.1` tag: `make test-php81`

### Release process

Calling `make push-php*` will:
- Run the build script
- Run all tests
- Push the image to docker repository

Release a specific tag:

- Release `8.0` tag: `make push-php80`
- Release `8.1` tag: `make push-php81`

Release all tags at once: `make push-php`.
