# dotnet_core_workshop

## Install Docker on your machine
* after install docker, you should set docker-cn as primary docker registry

## setup a private docker repository
* 我们使用nexus作为docker的私有仓库，除此之外，它开可以用作私有的maven仓库

```
 docker run -d -p 5000:8081 -p 5001:8082 --name nexus3 -v c:/Users/bgong/Documents/data/volumes/nexus:/nexus-data sonatype/nexus3:3.15.2

```
* 进入setting 后，选择"create repository" --> "docker[hosted]" --> 在"Repository connectors"中配置http上传用的端口号，一般用8082（这就是为什么之前我们启动nexus时要将8082端口映射出来）

## setup pipeline
[Use jenkins to setup a pipeline](https://jenkins.io/doc/book/installing/)

[Official jenkins docker image](https://github.com/jenkinsci/docker/blob/master/README.md)

```
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

```