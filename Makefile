.PHONY: up
up:
	systemctl stop --user arrpc.service # Inlook uses the same port
	docker compose -f ./services/CCForms/docker-compose.yml up -d
	docker compose -f ./services/CCalendar/docker-compose.yml up -d
	docker compose -f ./services/ExCCel/docker-compose.yml up -d
	docker compose -f ./services/Inlook/docker-compose.yml up -d

.PHONY: down
down:
	systemctl start --user arrpc.service # Inlook uses the same port
	docker compose -f ./services/CCForms/docker-compose.yml down
	docker compose -f ./services/CCalendar/docker-compose.yml down
	docker compose -f ./services/ExCCel/docker-compose.yml down
	docker compose -f ./services/Inlook/docker-compose.yml down

.PHONY: setup
setup:
	systemctl stop --user arrpc.service # Inlook uses the same port
	cd ./services/CCForms/; ./deploy.sh
	cd ./services/CCalendar/; ./deploy.sh
	cd ./services/ExCCel/; ./start.sh
	cd ./services/Inlook/; ./deploy.sh
