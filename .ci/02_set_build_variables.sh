#!/bin/bash

# Set variables
CONTAINER_REPO_NAME=$(echo "${TRAVIS_REPO_SLUG:-'train'}" | awk '{print tolower($0)}')

if [ "${GIT_TAG}" == "master" ]; then
  CONTAINER_IMAGE_TAG="latest"
else
  CONTAINER_IMAGE_TAG="${GIT_TAG}"
fi

CONTAINER_IMAGE_NAME="${CONTAINER_REPO_NAME}:${CONTAINER_IMAGE_TAG}"

echo "CONTAINER_IMAGE_NAME: ${CONTAINER_IMAGE_NAME}"
