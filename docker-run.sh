#!/bin/bash

# parameters

REGION="ap-southeast-1"
REPO_NAME="aws-fcj-chatbot"
ACCOUNT="XXXXXXXXXXXXXX"
DOCKER_IMAGE="aws-fcj-chatbot"

# delete all docker images

sudo docker system prune -a

# Retrieve an authentication token and authenticate your Docker client to your registry.
# Use the AWS CLI:

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.$REGION.amazonaws.com

# Build your Docker image using the following command.
# For information on building a Docker file from scratch, see the instructions here.
# You can skip this step if your image has already been built:

docker build -t $DOCKER_IMAGE .

# After the build is completed, tag your image so you can push the image to this repository:
docker tag $DOCKER_IMAGE:latest $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$DOCKER_IMAGE:latest

# create ecr repository
aws ecr create-repository --registry-id $ACCOUNT --repository-name $REPO_NAME

# Run the following command to push this image to your newly created AWS repository:

docker push $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$DOCKER_IMAGE:latest
