all: create_volumes up

create_volumes:
	mkdir -p $(HOME)/data/mariadb_data
	mkdir -p $(HOME)/data/wordpress_data

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

up-%:
	docker-compose -f srcs/docker-compose.yml up $* -d

build:
	docker-compose -f srcs/docker-compose.yml build

build-%:
	docker-compose -f srcs/docker-compose.yml build $*

start:
	docker-compose -f srcs/docker-compose.yml start

down:
	docker-compose -f srcs/docker-compose.yml down

stop:
	docker-compose -f srcs/docker-compose.yml stop

restart:
	docker-compose -f srcs/docker-compose.yml restart

logs:
	docker-compose -f srcs/docker-compose.yml logs

clean: down
	sudo rm -rf $(HOME)/data
	docker-clean

fclean: clean
# 	docker volume rm $$(docker volume ls -q)
# 	docker rmi $$(docker images -aq)
	docker rmi $$(docker images -q)

re: clean all

.PHONY: all create_volumes up build down stop restart logs clean re