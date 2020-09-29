#!/bin/bash

if [ "$TAG" != "latest" ]; then
  GIT_TAG=$(git tag | tail -n${TAG} | head -n1)
  set -ex
  git checkout ${GIT_TAG}
  set +ex
fi