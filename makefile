# REQUIRED SECTION
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
# END OF REQUIRED SECTION

.PHONY: help up start stop test

up: # start forground
	docker compose -f docker-compose.yml up $(c)

start: # start background
	docker compose -f docker-compose.yml up $(c) -d

stop: # stop docker compose
	docker compose -f docker-compose.yml stop $(c)

logs:
	docker compose -f docker-compose.yml logs --tail=100 -f $(c)

test:
	curl -X GET  http://127.0.0.1:8000/
	curl -X PUT  http://127.0.0.1:8000/data/mykey/myvalue
	curl -X GET  http://127.0.0.1:8000/data/mykey


	


