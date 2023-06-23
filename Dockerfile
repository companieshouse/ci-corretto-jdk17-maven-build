ARG CORE_VERSION="latest"
FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-base-build:${CORE_VERSION}

ARG ARTIFACTORY_URL=""
ENV ARTIFACTORY_URL=${ARTIFACTORY_URL}

RUN dnf update -y && \
    dnf install -y \
    java-17-amazon-corretto \
    maven && \
    dnf clean all

COPY resources/configure-maven /usr/local/bin/configure-maven
