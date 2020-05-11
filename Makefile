.PHONY: help clean dev docs package test deploy ci docker setup hub sonar

PATH := $(CURDIR)/bin:$(CURDIR)/bin/sonar-scanner/bin:$(PATH)
APP_VERSION ?= $(shell grep current_version .bumpversion.cfg | sed -E 's/.*=//g;s/ //g')
TAG ?= $(APP_VERSION)

docker:
	@echo "~~~ Building Docker Image"
	@docker build \
		--build-arg APP_VERSION=$(APP_VERSION) \
		--file Dockerfile \
		--tag app:$(TAG) .

bump_patch:
	@bumpversion patch

bump_minor:
	@bumpversion minor

bump_test:
	@bumpversion patch --allow-dirty
