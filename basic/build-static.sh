#!/bin/bash

set -e

name=basic

docker build -t "$name-build" .

mkdir -p ./bin
stack --docker install --flag $name:static --local-bin-path ./bin

