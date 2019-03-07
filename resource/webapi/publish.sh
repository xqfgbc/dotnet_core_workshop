#!/bin/bash

HostUrl="localhost:5002"
AppName="webapiapp"
ImageName="${HostUrl}/${AppName}:${BUILD_NUMBER}"

echo "image name is: ${ImageName}"

echo "begin pull image"
docker pull ${ImageName}

echo "begin run image"
docker run -d ${ImageName}

echo "success run image: ${ImageName}"

