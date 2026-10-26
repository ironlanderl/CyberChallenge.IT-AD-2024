.PHONY: up
up:
	cd ./services/CCForms/; ./deploy.sh

.PHONY: down
down:
	docker compose -f ./services/CCForms/docker-compose.yml down

.PHONY: check
check:
	cd ./checkers/CCForms-1/; python checker.py dev
	cd ./checkers/CCForms-2/; python checker.py dev
