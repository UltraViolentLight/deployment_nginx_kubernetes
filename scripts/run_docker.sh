#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build --tag=deployment_nginx_kubernetes ../.

# List docker images
docker image ls

# Run app
docker run -d -p 80:80 deployment_nginx_kubernetes
