DOCKER_IMAGE_NAME=urweb

build:
	docker build -t ${USER}/${DOCKER_IMAGE_NAME} .

console:
	docker run -it \
		-p 8080:8080 \
		${USER}/${DOCKER_IMAGE_NAME} bash

clean:
	docker rmi john/urweb || true

.PHONY: build
