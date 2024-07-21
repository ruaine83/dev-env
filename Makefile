


BASE_DIR=$(shell pwd)
CONFIG_DIR=${BASE_DIR}/config


include ${CONFIG_DIR}/Makefile.config

all:

build:
	@ docker login -u ${DOCKER_LOGIN} -p "${DOCKER_PASS}"
	@ docker-compose -f ${DOCKER_COMPOSE_FILE} build