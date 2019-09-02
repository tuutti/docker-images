REPOSITORY = registry.gitlab.com/tuutti/drupal-php-docker
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
