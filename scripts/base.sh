#!/bin/bash

method=$1
version=${2:-latest}
no_tty=${3:-}

name=tesseract-ocr-$method-ubuntu-$version

docker build -t $name -f $method/Dockerfile --build-arg VERSION=$version .
arguments=(--rm)
if [ -z "$no_tty" ]; then
    arguments+=(-it)
fi
docker run "${args[@]}" $name