# dotnet_core_workshop

## Install Docker on your machine
* after install docker, you should set docker-cn as primary docker registry

## setup pipeline
[Use jenkins to setup a pipeline](https://jenkins.io/doc/book/installing/)

[Official jenkins docker image](https://github.com/jenkinsci/docker/blob/master/README.md)

```
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

```

