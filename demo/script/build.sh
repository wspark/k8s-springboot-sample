#!/bin/sh
. ./env.sh

## podman build ##
#podman build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ../

echo "======================================================="
echo " IMAGE BUILD - ${CONTAINER_NAME} "
echo "======================================================="
buildah bud --format=docker -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ../
buildah login -u wspark83 -p "password" ${REGISTRY}
buildah push  ${REGISTRY}/${IMAGE_NAME}:${TAG} 