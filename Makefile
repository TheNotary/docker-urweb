TAG=20151122

build:
	docker build -t "urweb" .

tag:
	docker tag -f "urweb" "bogdanp/urweb:latest"
	docker tag -f "urweb" "bogdanp/urweb:$(TAG)"
