#!/usr/bin/env bash

# Create dockerpath
dockerpath="ultraviolentlight/website"

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
  docker image tag website $dockerpath

# Push image to a docker repository
docker image push $dockerpath
