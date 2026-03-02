SERVICE_NAME ?= slackin

EC2_INSTANCE_NAME ?= ooni-$(SERVICE_NAME)
IMAGE_NAME ?= ooni/$(SERVICE_NAME)
DATE := $(shell python3 -c "import datetime;print(datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%d'))")
GIT_FULL_SHA ?= $(shell git rev-parse HEAD)
SHORT_SHA := $(shell echo ${GIT_FULL_SHA} | cut -c1-8)
PKG_VERSION := $(shell jq -r .version package.json)

BUILD_LABEL := $(DATE)-$(SHORT_SHA)
VERSION_LABEL = v$(PKG_VERSION)
ENV_LABEL ?= latest

print-labels:
	echo "EC2_INSTANCE_NAME=${EC2_INSTANCE_NAME}"
	echo "PKG_VERSION=${PKG_VERSION}"
	echo "BUILD_LABEL=${BUILD_LABEL}"
	echo "VERSION_LABEL=${VERSION_LABEL}"
	echo "ENV_LABEL=${ENV_LABEL}"

docker-build:
	# We need to use tar -czh to resolve the common dir symlink
	tar -czh . | docker build \
		--build-arg BUILD_LABEL=${BUILD_LABEL} \
		-t ${IMAGE_NAME}:${BUILD_LABEL} \
		-t ${IMAGE_NAME}:${VERSION_LABEL} \
		-t ${IMAGE_NAME}:${ENV_LABEL} \
		-
	echo "built image: ${IMAGE_NAME}:${BUILD_LABEL} (${IMAGE_NAME}:${VERSION_LABEL} ${IMAGE_NAME}:${ENV_LABEL})"

docker-push:
	# We need to use tar -czh to resolve the common dir symlink
	docker push ${IMAGE_NAME}:${BUILD_LABEL}
	docker push ${IMAGE_NAME}:${VERSION_LABEL}
	docker push ${IMAGE_NAME}:${ENV_LABEL}

docker-smoketest:
	./scripts/docker-smoketest.sh ${IMAGE_NAME}:${BUILD_LABEL}

imagedefinitions.json:
	echo '[{"name":"${EC2_INSTANCE_NAME}","imageUri":"${IMAGE_NAME}:${BUILD_LABEL}"}]' > imagedefinitions.json

test:
	npm test

build:
	npm install

clean:
	rm -f imagedefinitions.json
	rm -fr node_modules
	rm assets/main.css
	rm npm-debug.log

run:
	npm run dev

.PHONY: test build clean docker print-labels
