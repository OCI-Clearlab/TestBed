#!/usr/bin/env bash

set -eux

VERSION="v1"

GOOS=linux go build -v -o .
docker build -t "arosilier/hello:${VERSION}" .

if [[ -z "${DRY_RUN:-}" ]]; then
  docker push "arosilier/hello:${VERSION}"
fi
