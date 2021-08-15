all: build down up
build:
	docker build -t getting-started-nginx .
up:
	docker run -d --rm -p 80:80 --name testing getting-started-nginx
down:
	docker ps -a -q --filter="name=testing" | xargs docker stop
