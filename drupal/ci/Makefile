PHP_VERSION ?= 8.5
REPOSITORY = ghcr.io/tuutti/drupal-php-docker

PHONY += run-php85
run-php85:
	docker run -it --rm -u 100000 $(REPOSITORY):8.5 /bin/sh

PHONY += run-php84
run-php84:
	docker run -it --rm -u 100000 $(REPOSITORY):8.4 /bin/sh

PHONY += run-php83
run-php83:
	docker run -it --rm -u 100000 $(REPOSITORY):8.3 /bin/sh

PHONY += build-php85
build-php85:
	$(call build_image,8.5)

PHONY += build-php84
build-php84:
	$(call build_image,8.4)

PHONY += build-php83
build-php83:
	$(call build_image,8.3)

PHONY += push-php85
push-php85: test-php85
	docker push $(REPOSITORY):8.5

PHONY += push-php84
push-php84: test-php84
	docker push $(REPOSITORY):8.4

PHONY += push-php83
push-php83: test-php83
	docker push $(REPOSITORY):8.3

PHONY += test-php85
test-php85: build-php85
	container-structure-test test --image $(REPOSITORY):8.5 --config tests/php85.yaml
	container-structure-test test --image $(REPOSITORY):8.5 --config tests/php.yaml

PHONY += test-php84
test-php84: build-php84
	container-structure-test test --image $(REPOSITORY):8.4 --config tests/php84.yaml
	container-structure-test test --image $(REPOSITORY):8.4 --config tests/php.yaml

PHONY += test-php83
test-php83: build-php83
	container-structure-test test --image $(REPOSITORY):8.3 --config tests/php83.yaml
	container-structure-test test --image $(REPOSITORY):8.3 --config tests/php.yaml

PHONY += test-php
test-php: test-php85 test-php84 test-php83

PHONY += push-php
push-php: push-php85 push-php84 push-php83

define build_image
	docker build --pull -t $(REPOSITORY):$(1) --build-arg BASE_IMAGE_TAG=$(1)-alpine ./
endef

.PHONY: $(PHONY)
