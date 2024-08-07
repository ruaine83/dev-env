ARG BASE_IMAGE
ARG PLATFORM
FROM --platform=linux/${PLATFORM} ${BASE_IMAGE}

ARG APT_LIST

RUN mkdir /workspace

# Add Docker's official GPG key:
RUN apt-get update
RUN apt-get install -y ca-certificates curl apt-transport-https && \
    install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update
RUN apt-get -y upgrade && \
    apt-get -q -y install ${APT_LIST}

ENTRYPOINT [ "bin/bash", "-c", "while true; do sleep 100; done" ]