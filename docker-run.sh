#!/bin/bash

# Read input from file
source input.txt

# Delete all docker images
sudo docker system prune -a

# Authenticate Docker client to your registry
aws ecr get-login-password --region "$REGION" | docker login --username AWS --password-stdin "$ACCOUNT".dkr.ecr."$REGION".amazonaws.com

# Build and tag Docker image
docker build -t "$DOCKER_IMAGE" .

# Push Docker image to repository
docker push "$ACCOUNT".dkr.ecr."$REGION".amazonaws.com/"$DOCKER_IMAGE":latest