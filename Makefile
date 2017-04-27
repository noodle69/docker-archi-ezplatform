UID:=$(shell id -u)
GID:=$(shell id -g)
CC:=docker-compose

init: _docker-base
	$(CC) up -d

_docker-base:
	@echo "version: '2'" > .docker-base.yml
	@echo "" >> .docker-base.yml
	@echo "services:" >> .docker-base.yml
	@echo "    mother:" >> .docker-base.yml
	@echo "        user: $(UID):$(GID)" >> .docker-base.yml
	@echo "        environment:" >> .docker-base.yml
	@echo "            USER: root" >> .docker-base.yml

