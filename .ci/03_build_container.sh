#!/bin/bash

# fail and print
set -ex

# build image
docker build -t ${CONTAINER_IMAGE_NAME} --no-cache . 

set +ex