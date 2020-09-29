#!/bin/bash

set -ex

docker push ${CONTAINER_IMAGE_NAME}

set +ex