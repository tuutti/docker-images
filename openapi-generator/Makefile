PHONY :=
COMMAND = openapi-generator-cli
REPOSITORY = ghcr.io/tuutti/openapi-generator
VERSION=5.3.0

ifeq ($(TAG),)
	TAG = latest
endif

PHONY += build
build:
	docker build -t $(REPOSITORY):$(TAG) --build-arg OPENAPI_VERSION=$(VERSION) ./

PHONY += push
push:
	docker push $(REPOSITORY):$(TAG)

.PHONY: $(PHONY)
