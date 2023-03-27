#!/bin/bash

# For each directory except "scripts"
for dir in $(ls -d */ | grep -v scripts); do
    # Copy the sample image to the directory
    cp sample.png $dir
done