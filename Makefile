.PHONY: up
up:
	systemctl stop --user arrpc.service # Inlook uses the same port
	cd ./services/CCForms/; ./deploy.sh
	cd ./services/CCalendar/; ./deploy.sh
	cd ./services/ExCCel/; ./start.sh
	cd ./services/Inlook/; ./deploy.sh

.PHONY: down
down:
	docker compose -f ./services/CCForms/docker-compose.yml down
	docker compose -f ./services/CCalendar/docker-compose.yml down
	docker compose -f ./services/ExCCel/docker-compose.yml down
	docker compose -f ./services/Inlook/docker-compose.yml down

.PHONY: check
check:
	cd ./checkers/CCForms-1/; python checker.py dev
	cd ./checkers/CCForms-2/; python checker.py dev
