#!/bin/sh
. ./env.sh

## podman build ##
#podman build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ../

echo "======================================================="
echo " IMAGE BUILD - ${CONTAINER_NAME} "
echo "======================================================="
buildah bud --format=docker -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ../
#podman run -d --name ${CONTAINER_NAME} -p 8180:8180 -v /data/nexus:/nexus-data ${REGISTRY}/${IMAGE_NAME}:${TAG}
#podman run -d --name ${CONTAINER_NAME} --log-driver=local -p 8580:8080 -v /test/DOCKER/podman-image/jws52/logs:/usr/local/jws-5.2/tomcat/logs ${IMAGE_NAME}:${TAG}

