# tesseract-ubuntu-docker-installation
A set of Dockerfiles showing how to install tesseract ocr on Ubuntu

## Project purpose

The purpose of the project is to show and try the various ways in which [tesseract ocr](https://github.com/tesseract-ocr/tesseract) can be installed on Ubuntu

For each method there is a different folder with a Dockerfile and a README.md file explaining the method.

The version in question of tesseract is **5.3.0**.

## Methods

* [notesalexp](./notesalexp)
* [launchpad](./launchpad)
* [build](./build)

## Dockerfiles

The dockerfiles:

* Install tesseract ocr
* Install some languages
* Display the languages during the build phase
* When run they execute tesseract on a [sample image](./sample.png) and display the output

## How to execute it

* Have docker installed
* Run `./run.sh <method> [version]` where method is one of the methods (build/launchpad/notesalexp) and version is the version of ubuntu (default is latest, but every tag to the ubuntu docker image is valid)

