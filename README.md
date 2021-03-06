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

* 下载并安装jenkins docker images
```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

```

* 成功启动jenkins后，需要在容器内安装docker
```
docker exec -it -u root jenkins bash
```

* 进入容器后执行以下操作
```
apt-get update && apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"

apt-get update 

#查看可用的版本
apt-cache madison docker-ce

#docker的版本需要与host上的docker engine兼容
apt-get install -y docker-ce=5:18.09.2~3-0~debian-stretch

#使用docker登录我们自己的私有仓库
docker login -u admin -p admin123 localhost:5002
```

* 将jenkins用户加入docker,root group,因为之前我们使用root账户安装的docker
```
sudo usermod -a -G docker jenkins
sudo usermod -a -G root jenkins

```