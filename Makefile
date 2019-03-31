REPOSITORY = registry.gitlab.com/tuutti/drupal-php-docker
ifeq ($(TAG),)
	TAG = $(PHP_VER)
endif

.PHONY: build test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg BASE_IMAGE_TAG=$(TAG) ./
	docker build -t registry.gitlab.com/tuutti/drupal-php-docker .

push:
	docker push $(REPOSITORY):$(TAG)

release: build push
