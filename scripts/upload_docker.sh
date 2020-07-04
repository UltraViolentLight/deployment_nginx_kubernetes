#!/usr/bin/env bash

# Create dockerpath
dockerpath="ultraviolentlight/deployment_nginx_kubernetes"

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
  docker image tag deployment_nginx_kubernetes $dockerpath

# Push image to a docker repository
docker image push $dockerpath
