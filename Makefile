mkdir:
	mkdir -p /home/akadi/data
	mkdir -p /home/akadi/data/wordpress
	mkdir -p /home/akadi/data/mariadb
up : 
	docker-compose -f ./srcs/docker-compose.yml build
	docker-compose -f ./srcs/docker-compose.yml up -d
down:
	docker-compose -f ./srcs/docker-compose.yml down

ps :
	docker-compose -f ./srcs/docker-compose.yml ps

rm :
	docker rm -f $$(docker ps -aq)
	docker rmi -f $$(docker image ls -aq)
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress