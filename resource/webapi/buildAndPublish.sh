#!/bin/bash

HostUrl="localhost:5002"
AppName="webapiapp"
ImageName="${HostUrl}/${AppName}:${BUILD_NUMBER}"
Dockerfile="Dockerfile"

echo "image name is: ${ImageName}"

echo "begin build image"
docker build -t ${ImageName} -f ${Dockerfile} .

echo "begin push image"
docker push ${ImageName}

echo "remove image in docker"
docker rmi ${ImageName}

echo "success build and publish image: ${ImageName}"

