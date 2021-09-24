#!/usr/bin/env bash

set -eux

VERSION="v1"

GOOS=linux go build -v -o .
docker build -t "arosilier/hello:${VERSION}" .
docker push "arosilier/hello:${VERSION}"

