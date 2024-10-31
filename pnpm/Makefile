## Defensive settings for make:
#     https://tech.davis-hansson.com/p/make/
SHELL:=bash
.ONESHELL:
.SHELLFLAGS:=-xeu -o pipefail -O inherit_errexit -c
.SILENT:
.DELETE_ON_ERROR:
MAKEFLAGS+=--warn-undefined-variables
MAKEFLAGS+=--no-builtin-rules

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

# Current version
MAIN_IMAGE_NAME=plone/plone-frontend
BASE_IMAGE_NAME=plone/frontend
VOLTO_VERSION=$$(cat ../version.txt)
IMAGE_TAG=${VOLTO_VERSION}
IMAGE_SUFFIX=

.PHONY: all
all: help

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: # This help message
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Build image
.PHONY: show-image
show-image: ## Print Version
	@echo "$(MAIN_IMAGE_NAME):$(IMAGE_TAG)$(IMAGE_SUFFIX)"
	@echo "$(BASE_IMAGE_NAME)-(builder|dev|prod-config):$(IMAGE_TAG)$(IMAGE_SUFFIX)"

.PHONY: image-builder
image-builder:  ## Build Base Image
	@echo "Building $(BASE_IMAGE_NAME)-builder:$(IMAGE_TAG)$(IMAGE_SUFFIX) (PNPM)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(BASE_IMAGE_NAME)-builder:$(IMAGE_TAG)$(IMAGE_SUFFIX) -f Dockerfile.builder --load

.PHONY: image-dev
image-dev:  ## Build Dev Image
	@echo "Building $(BASE_IMAGE_NAME)-dev:$(IMAGE_TAG)$(IMAGE_SUFFIX)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(BASE_IMAGE_NAME)-dev:$(IMAGE_TAG)$(IMAGE_SUFFIX) -f Dockerfile.dev --load

.PHONY: image-prod-config
image-prod-config:  ## Build Prod Image
	@echo "Building $(BASE_IMAGE_NAME)-prod-config:$(IMAGE_TAG)$(IMAGE_SUFFIX)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(BASE_IMAGE_NAME)-prod-config:$(IMAGE_TAG)$(IMAGE_SUFFIX) -f Dockerfile.prod --load

.PHONY: image-main
image-main:  ## Build main image
	@echo "Building $(MAIN_IMAGE_NAME):$(IMAGE_TAG)$(IMAGE_SUFFIX)"
	@docker buildx build . --build-arg VOLTO_VERSION=${VOLTO_VERSION} -t $(MAIN_IMAGE_NAME):$(IMAGE_TAG)$(IMAGE_SUFFIX) -f Dockerfile --load
