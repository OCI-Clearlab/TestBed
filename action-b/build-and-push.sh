#!/usr/bin/env bash

set -eux

export DOCKER_CLI_EXPERIMENTAL=enabled

CONTAINER_CLI=${CONTAINER_CLI:-docker}
CONTAINER_BUILDER=${CONTAINER_BUILDER:-"buildx build"}

DATE=$(date +%Y-%m-%dT%H-%M-%S)
BRANCH=master
VERSION="${BRANCH}-${DATE}"
SHA="${BRANCH}

if [[ "$(uname -m)" == "x86_64" ]]; then
  ${CONTAINER_CLI} ${CONTAINER_BUILDER} -t "${HUB}/hello:${VERSION}" --platform linux/amd64 .
fi

if [[ -z "${DRY_RUN:-}" ]]; then
  ${CONTAINER_CLI} push "${HUB}/hello:${VERSION}"
fi
