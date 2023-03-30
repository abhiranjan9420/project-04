#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=abhiranjan88/udacity-04

# Step 2
# Run the Docker Hub container with kubernetes
r=$(kubectl get pod udacity-04 2> /dev/null;echo $?)

if [ "_$r" == "_1" ] ; then
    kubectl run ml-api \
    --image=$dockerpath \
    --image-pull-policy="Always" \
    --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "regcred"}]}}'
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-api 8080:80
