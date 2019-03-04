#!/bin/bash

HostUrl="localhost:5002"
AppName="webapiapp"
ImageName="${HostUrl}/${AppName}:${BUILD_NUMBER}"
Dockerfile="Dockerfile"

echo "image name is: ${ImageName}"

echo "begin build image"
docker build --pull -t ${ImageName} -f ${Dockerfile} ./resource/webapi/

echo "begin push image"
docker push ${ImageName}

echo "success build and publish image: ${ImageName}"
