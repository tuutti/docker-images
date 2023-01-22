PHP_VERSION ?= 8.0
REPOSITORY = ghcr.io/tuutti/drupal-php-docker

PHONY += run-php80
run-php80:
	docker run -it --rm -u 100000 $(REPOSITORY):8.0 /bin/sh

PHONY += build-php80
build-php80:
	$(call build_image,8.0)

PHONY += push-php80
push-php80: test-php80
	docker push $(REPOSITORY):8.0

PHONY += run-php81
run-php81:
	docker run -it --rm -u 100000 $(REPOSITORY):8.1 /bin/sh

PHONY += run-php82
run-php82:
	docker run -it --rm -u 100000 $(REPOSITORY):8.2 /bin/sh

PHONY += build-php81
build-php81:
	$(call build_image,8.1)

PHONY += build-php82
build-php82:
	$(call build_image,8.2)

PHONY += push-php81
push-php81: test-php81
	docker push $(REPOSITORY):8.1

PHONY += push-php82
push-php82: test-php82
	docker push $(REPOSITORY):8.2

PHONY += test-php80
test-php80: build-php80
	container-structure-test test --image $(REPOSITORY):8.0 --config tests/php80.yaml
	container-structure-test test --image $(REPOSITORY):8.0 --config tests/php.yaml

PHONY += test-php81
test-php81: build-php81
	container-structure-test test --image $(REPOSITORY):8.1 --config tests/php81.yaml
	container-structure-test test --image $(REPOSITORY):8.1 --config tests/php.yaml

PHONY += test-php82
test-php82: build-php82
	container-structure-test test --image $(REPOSITORY):8.2 --config tests/php82.yaml
	container-structure-test test --image $(REPOSITORY):8.2 --config tests/php.yaml

PHONY += test-php
test-php: test-php80 test-php81 test-php82

PHONY += push-php
push-php: push-php80 push-php81 push-php82

define build_image
	docker build --pull -t $(REPOSITORY):$(1) --build-arg BASE_IMAGE_TAG=$(1)-alpine ./
endef

.PHONY: $(PHONY)
