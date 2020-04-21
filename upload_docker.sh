#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Create dockerpath

img=myapp:green
username=donko

dockerpath=$username/$img

echo "Docker ID and Image: $dockerpath"

# Push image to a docker repository
docker push $dockerpath
