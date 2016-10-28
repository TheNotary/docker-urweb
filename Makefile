DOCKER_IMAGE_NAME=urweb
TAG=20151122

build:
	docker build -t ${USER}/${DOCKER_IMAGE_NAME} .

console:
	docker run -it \
		-p 8080:8080 \
		${USER}/${DOCKER_IMAGE_NAME} bash

tag:
	docker tag -f ${DOCKER_IMAGE_NAME} "${USER}/${DOCKER_IMAGE_NAME}:latest"
	docker tag -f ${DOCKER_IMAGE_NAME} "${USER}/${DOCKER_IMAGE_NAME}:$(TAG)"

.PHONY: build
