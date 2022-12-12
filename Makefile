DOCKER_USERNAME ?= jaysoftware
APPLICATION_NAME ?= rotaract_frontend
 
buildit:
	docker build --platform=linux/amd64 --tag ${DOCKER_USERNAME}/${APPLICATION_NAME} .

push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}

resetnginx:
	docker compose down && \
	docker volume rm nginx_conf && \
	docker volume create --name=nginx_conf && \
	docker compose up -d

all:
	make buildit && make push