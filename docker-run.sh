#!/bin/bash

# Read input from file
source input.txt

# Delete all Docker images
sudo docker system prune -a

# Authenticate Docker client to your registry
aws ecr get-login-password --region "$REGION" | docker login --username AWS --password-stdin "$ACCOUNT".dkr.ecr."$REGION".amazonaws.com

# Build and tag Docker image
docker build -t "$DOCKER_IMAGE" .

# Tag the Docker image
docker tag "$DOCKER_IMAGE":latest "$ACCOUNT".dkr.ecr."$REGION".amazonaws.com/"$DOCKER_IMAGE":latest

# Push Docker image to the repository
docker push "$ACCOUNT".dkr.ecr."$REGION".amazonaws.com/"$DOCKER_IMAGE":latest


