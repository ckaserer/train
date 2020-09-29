#!/bin/bash

if [ "${TAG}" != "latest" ]; then
  GIT_TAG=$(git tag | tail -n${TAG} | head -n1)
  set -x
  git checkout ${GIT_TAG}
  set +x
else
  GIT_TAG="${TRAVIS_BRANCH}"
fi