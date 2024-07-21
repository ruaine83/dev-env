ARG BASE_IMG
ARG PLATFORM
FROM --platform=${PLATFORM} ${BASE_IMAGE}

ARG APT_LIST

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -q -y install ${APT_LIST}

ENTRYPOINT [ "/bin/bash" ]