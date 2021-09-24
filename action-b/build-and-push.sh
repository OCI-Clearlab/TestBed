#!/usr/bin/env bash

set -eux
export DOCKER_CLI_EXPERIMENTAL=enabled

VERSION="v1"
HUB="docker.io/arosilier"

GOOS=linux go build -v -o .

docker-buildx build -t "${HUB}/hello:${VERSION}" .

if [[ -z "${DRY_RUN:-}" ]]; then
  docker push "${HUB}/hello:${VERSION}"
fi
