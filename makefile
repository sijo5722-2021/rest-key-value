# REQUIRED SECTION
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
# END OF REQUIRED SECTION

.PHONY: help up start stop build test logs test

up: #start forground
	docker compose -f docker-compose.yml up $(c)

start: #start background
	docker compose -f docker-compose.yml up $(c) -d

stop: #stop docker compose
	docker compose -f docker-compose.yml stop $(c)

build: #build dockerimage
	docker compose -f docker-compose.yml build $(c)
logs:  #get log stream
	docker compose -f docker-compose.yml logs --tail=100 -f $(c)

test:  #test the application
	curl -X GET  http://127.0.0.1:8000/
	curl -X PUT  http://127.0.0.1:8000/data/mykey/myvalue
	curl -X GET  http://127.0.0.1:8000/data/mykey

help:
	@printf "make up - to start the containers in fordground mode\nmake start - to start the conainers in background\nmake stop - to stop the containers\nmake build - to build webapp docker image\nmake logs - to get the log stream\nmake test - to test the webapp\n"
	


