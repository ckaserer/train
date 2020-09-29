#!/bin/bash

set -x

# build image
docker build -t ${CONTAINER_IMAGE_NAME} --no-cache . 

set +x