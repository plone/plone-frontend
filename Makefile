## Defensive settings for make:
#     https://tech.davis-hansson.com/p/make/
SHELL:=bash
.ONESHELL:
.SHELLFLAGS:=-xeu -o pipefail -O inherit_errexit -c
.SILENT:
.DELETE_ON_ERROR:
MAKEFLAGS+=--warn-undefined-variables
MAKEFLAGS+=--no-builtin-rules

NIGHTLY_IMAGE_TAG=nightly

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

# Current version
MAIN_IMAGE_NAME=plone/plone-frontend
BASE_IMAGE_NAME=plone/frontend
VOLTO_VERSION=$$(cat version.txt)
IMAGE_TAG=${VOLTO_VERSION}
NIGHTLY_IMAGE_TAG=nightly

# Code Quality
CURRENT_FOLDER=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CODE_QUALITY_VERSION=2.1.0
ifndef LOG_LEVEL
	LOG_LEVEL=INFO
endif
CURRENT_USER=$$(whoami)
USER_INFO=$$(id -u ${CURRENT_USER}):$$(getent group ${CURRENT_USER}|cut -d: -f3)
LINT=docker run --rm -e LOG_LEVEL="${LOG_LEVEL}" -v "${CURRENT_FOLDER}":/github/workspace plone/code-quality:${CODE_QUALITY_VERSION} check
FORMAT=docker run --rm --user="${USER_INFO}" -e LOG_LEVEL="${LOG_LEVEL}" -v "${CURRENT_FOLDER}":/github/workspace plone/code-quality:${CODE_QUALITY_VERSION} format



.PHONY: all
all: help

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: # This help message
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Format
.PHONY: format
format: ## Format the codebase according to our standards
	@echo "$(GREEN)==> Format Python helper$(RESET)"
	$(FORMAT)

.PHONY: lint
lint: ## check code style
	$(LINT)

# Build image
.PHONY: show-image
show-image: ## Print Version
	@echo "$(MAIN_IMAGE_NAME):$(IMAGE_TAG)"
	@echo "$(MAIN_IMAGE_NAME):$(NIGHTLY_IMAGE_TAG)"
	@echo "$(BASE_IMAGE_NAME)-(builder|dev|prod-config):$(IMAGE_TAG)"

.PHONY: image-builder
image-builder:  ## Build Base Image
	@echo "Building $(BASE_IMAGE_NAME)-builder:$(IMAGE_TAG)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(BASE_IMAGE_NAME)-builder:$(IMAGE_TAG) -f Dockerfile.builder --load

.PHONY: image-dev
image-dev:  ## Build Dev Image
	@echo "Building $(BASE_IMAGE_NAME)-dev:$(IMAGE_TAG)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(BASE_IMAGE_NAME)-dev:$(IMAGE_TAG) -f Dockerfile.dev --load

.PHONY: image-prod-config
image-prod-config:  ## Build Prod Image
	@echo "Building $(BASE_IMAGE_NAME)-prod-config:$(IMAGE_TAG)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(BASE_IMAGE_NAME)-prod-config:$(IMAGE_TAG) -f Dockerfile.prod --load

.PHONY: image-main
image-main:  ## Build main image
	@echo "Building $(MAIN_IMAGE_NAME):$(IMAGE_TAG)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(MAIN_IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile --load

.PHONY: image-nightly
image-nightly:  ## Build Docker Image Nightly
	@echo "Building $(MAIN_IMAGE_NAME):$(NIGHTLY_IMAGE_TAG)"
	@docker build . -t $(MAIN_IMAGE_NAME):$(NIGHTLY_IMAGE_TAG) -f Dockerfile.nightly

.PHONY: build-images
build-images:  ## Build Images
	@echo "Building $(BASE_IMAGE_NAME)-(builder|dev|prod):$(IMAGE_TAG) images"
	$(MAKE) image-builder
	$(MAKE) image-dev
	$(MAKE) image-prod-config
	@echo "Building $(MAIN_IMAGE_NAME):$(IMAGE_TAG)"
	$(MAKE) image-main

create-tag: # Create a new tag using git
	@echo "Creating new tag $(VOLTO_VERSION)"
	if git show-ref --tags v$(VOLTO_VERSION) --quiet; then echo "$(VOLTO_VERSION) already exists";else git tag -a v$(VOLTO_VERSION) -m "Release $(VOLTO_VERSION)" && git push && git push --tags;fi

commit-and-release: # Commit new version change and create tag
	@echo "Commiting changes"
	@git commit -am "Use Volto $(VOLTO_VERSION)"
	make create-tag
