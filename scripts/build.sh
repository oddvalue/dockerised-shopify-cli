#!/bin/sh

docker build --no-cache --force-rebuild --build-arg UID=$(id -u) --build-arg GID=$(id -g) ./ -t shopify-cli:latest
