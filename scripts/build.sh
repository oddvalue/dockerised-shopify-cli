#!/bin/sh

docker build --no-cache --build-arg UID=$(id -u) --build-arg GID=$(id -g) ./ -t shopify-cli:latest
