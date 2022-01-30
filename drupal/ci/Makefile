PHP_VERSION ?= 8.0
REPOSITORY = ghcr.io/tuutti/drupal-php-docker
BASE_IMAGE_TAG = $(PHP_VERSION)-alpine3.15

ifeq ($(TAG),)
	TAG = $(PHP_VERSION)
endif

.PHONY: build push release

default: build

build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
