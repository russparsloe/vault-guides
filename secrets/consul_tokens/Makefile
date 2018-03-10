all: down up

up:

	@echo '################################################'
	@echo '>>> Converging environment via docker-compose...'
	@echo '################################################'
	docker-compose up --build -d
	docker ps

down:
	@echo '#################################################'
	@echo '>>> Cleaning up environment via docker-compose...'
	@echo '#################################################'
	docker-compose down -v

quickstart:
	@echo '#####################################################'
	@echo '>>> Performing all necessary config for Quickstart...'
	@echo '#####################################################'
	@./scripts/quickstart.sh

test:
	@echo '######################################'
	@echo '>>> Run validation tests via InSpec...'
	@echo '######################################'
	@./scripts/test.sh


