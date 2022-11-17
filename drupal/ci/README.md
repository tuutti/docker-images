# Drupal CI docker image


Available PHP versions: `8.1`, `8.0`, `7.4`:

- `ghcr.io/tuutti/drupal-php-docker:8.1`
- `ghcr.io/tuutti/drupal-php-docker:8.0`
- `ghcr.io/tuutti/drupal-php-docker:7.4` (deprecated, left for legacy reasons)

All images include packages necessary to run all Drupal tests (including FunctionalJavascript tests using chromium-driver).

## Development

### Requirements

- [GoogleContainerTools/container-structure-test](https://github.com/GoogleContainerTools/container-structure-test)

### Building

To build a specific image, call:

- `8.0` tag: `make build-php80`
- `8.1` tag: `make build-php81`

To run built image locally:

- `8.0` tag: `make run-php80`
- `8.1` tag: `make run-php81`

### Testing

We use [GoogleContainerTools/container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) to test images. See [tests/](tests/) for available tests.

Running tests will always rebuild the image first.

- Run tests against `8.0` tag: `make test-php80`
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
