

CONTAINER_NAME ?= con-tcook-devenv-16
IMAGE_NAME ?= img-tcook-devenv
BASE_IMAGE_TAG = 16.04

BASE_DIR=$(shell pwd)
CONFIG_DIR=${BASE_DIR}/config

include ${CONFIG_DIR}/Makefile.config

ifneq (${BASE_IMAGE_TAG}, latest)
	APT_LIST = "bash net-tools inetutils-ping ssh git python python-pip python3 python3-pip gcc g++ gcc-aarch64-linux-gnu g++-aarch64-linux-gnu gdb gdb-multiarch docker.io docker-compose make cmake"
endif

clean:
	@ echo "---> Removing Docker Image ${IMAGE_NAME}:${CURR_VER}"
	@ docker image rm -f ${IMAGE_NAME}:${CURR_VER}

build_env_file:
	@ echo "---> Creating fresh env file: ${ENV_FILE}"
	@ if [ -f ${ENV_FILE} ]; then rm -rf ${ENV_FILE}; fi
	@ echo CONTAINER_NAME=${CONTAINER_NAME} >> ${ENV_FILE}
	@ echo IMAGE_NAME=${IMAGE_NAME}:${CURR_VER} >> ${ENV_FILE}
	@ echo APT_LIST="${APT_LIST}" >> ${ENV_FILE}
	@ echo BASE_IMAGE=${BASE_IMAGE} >> ${ENV_FILE}
	@ echo PLATFORM=${TARGET} >> ${ENV_FILE}
	@ echo VERSION_TAG=${CURR_VER} >> ${ENV_FILE}
	@ echo WK_DIR=$(shell pwd) >> ${ENV_FILE}

build: build_env_file
	@ echo "---> Building ${IMAGE_NAME}:${CURR_VER} with Env File of ${ENV_FILE}"
	@ echo "---> Docker Compose using Dockerfile: ${DOCKER_BUILD_FILE}"
	@ docker login -u ${DOCKER_LOGIN} -p "${DOCKER_PASS}"
	@ docker compose -f ${DOCKER_COMPOSE_FILE} build

run: build
	@ docker compose -f ${DOCKER_COMPOSE_FILE} up -d && \
	docker exec -it ${CONTAINER_NAME} /bin/bash && \
	docker compose -f ${DOCKER_COMPOSE_FILE} down

.PHONY: build build_env_file run