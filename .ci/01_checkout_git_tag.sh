#!/bin/bash

if [ "${TAG}" != "latest" ]; then
  GIT_TAG=$(git tag | tail -n${TAG} | head -n1)
  set -ex
  git checkout ${GIT_TAG}
  set +ex
elif [ "$(git rev-parse --abbrev-ref HEAD)" == "HEAD" ]; then
  GIT_TAG="$(git describe --tags --abbrev=0)"
else
  GIT_TAG="$(git rev-parse --abbrev-ref HEAD)"
fi