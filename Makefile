help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  start                    Start docker in daemon mode"
	@echo "  stop                     Stop docker"
	@echo "  shell                  	Enter shell"
	@echo "  rake-migrate             Generate certificates"

#Start/Build Containers
start:
	@docker-compose up -d

# Stop containers
stop:
	@docker-compose stop

# Shell into the dev container
shell:
	@docker-compose exec dev bash

# Run database migrations
rake-migrate:
	@rake db:migrate

server:
	@rails server

start-server:
	@docker-compose up -d
	@docker-compose exec dev bash | rails server
