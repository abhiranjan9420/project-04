#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=abhiranjan88/udacity-04

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

docker login -u abhiranjan88
docker tag ml-api $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest
