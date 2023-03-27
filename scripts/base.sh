#!/bin/bash

method=$1
version=${2:-latest}

name=tesseract-ocr-$method-ubuntu-$version

docker build -t $name -f $method/Dockerfile --build-arg VERSION=$version .
docker run -it --rm $name