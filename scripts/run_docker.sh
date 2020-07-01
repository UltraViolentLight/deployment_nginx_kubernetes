#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build --tag=website ../.

# List docker images
docker image ls

# Run app
docker run -d -p 80:80 website
