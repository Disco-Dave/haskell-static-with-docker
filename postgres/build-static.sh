#!/bin/bash

set -e

name=postgres

docker build -t "$name-build" . \
    --build-arg=BUILD_DEPS=" \
        zlib-dev \
        zlib-static \
        postgresql-dev \
    "

mkdir -p ./bin
stack --docker install --flag $name:static --local-bin-path ./bin

