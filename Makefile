.PHONY: up
up:
	docker-compose -f docker-compose.yml -f docker-compose-local-registry.yml up

down:
	docker-compose -f docker-compose.yml -f docker-compose-local-registry.yml down