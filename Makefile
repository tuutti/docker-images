PHP_VER ?= 7.3
REPOSITORY = registry.gitlab.com/tuutti/drupal-php-docker
BASE_IMAGE_TAG = $(PHP_VER)

ifeq ($(TAG),)
	TAG = $(PHP_VER)
endif

.PHONY: build push release

default: build

build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg BASE_IMAGE_TAG=$(TAG) ./

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
