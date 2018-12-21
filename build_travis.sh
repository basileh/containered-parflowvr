#!/bin/bash


$(git diff --name-only ${TRAVIS_COMMIT_RANGE} | grep parflowvr-deps/Dockerfile > /dev/null)
dockerfile_status=$?

set -e
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_NAME" --password-stdin

if [[ ${dockerfile_status} == "0" ]]
then
  echo "New docker image is required, building new image"
  docker build -t xy124/parflowvr-deps:latest parflowvr-deps
else
  echo "New docker image is not required"
  docker pull xy124/parflowvr-deps:latest
fi

docker build -t parflowvr-run --build-arg userid=$(id -u $USER) .

