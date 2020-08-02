

#                    docker的使用（02912019201920129102）

### 一、docker的安装和使用

https://docs.docker.com/engine/install/centos/   参考官网安装

```shell
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker.service
docker version
docker run hello-world

# https://docs.docker.com/machine/install-machine/  官网
#安装docker docker-machine

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
  docker-machine version
  
```

```shell
# Python虚拟环境的主要目的是为不同的Python项目创建一个隔离的环境。
yum install  -y  centos-release-scl  #安装scl工具 允许您在默认的python v2.7.5旁边安装新版本的python 3.x
yum install -y  rh-python36    #安装新版本的python
scl enable rh-python36 bash    # 激活当前新版本的python  Python 3.6仅在此shell会话中设置为默认的Python版本
     # 如果退出会话或从另一个终端打开一个新会话，Python 2.7将是默认的Python版本


mkdir my-flask-project;cd my-flask-project 
python -m venv project    # 在项目中创建python虚拟环境 
source  project/bin/activate   # 激活虚拟环境,从现在起与全局安装的Python隔绝开。
deactivate  # 停用虚拟环境
```

### 二、docker学习

#####  1.images 镜像

```shell
vim /etc/docker/daemon.json
{"registry-mirrors":["https://almtd3fa.mirror.aliyuncs.com"] } # 添加重启docker，加速下载image镜像文件。

https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors # only for me

source .bashrc                 #linux添加ll  
dircolors -p > .dircolors       # DIR 34 改为35  添加系统颜色
```



```shell
docker images            #  列出所有已经下载的镜像（镜像id 仓库名 创建时间 大小）
docker pull ubuntu:14.04    # 默认镜像文件从这个网站获取 https://hub.docker.com/search?q=&type=image 
docker build -t hello-demon:first-version  .    #打包镜像 
仓库名  hello-demon   标签  first-version   当前目录找Dockerfile 
docker history  c0223d490d03    # 该命令用于显示镜像的历史，查看镜像的历史变化。
                       # 查看docker镜像构建过程 还原dockerfile 
docker run hello-demon:first-version   # 运行docker images  需要仓库名+标签
docker run  c0223d490d03           # 运行docker images  需要镜像id
docker run -d  --name=flask   liuyuanyuandedocker/flask-demo  # 后台运行,指定容器名字
docker  rmi  -f                 #镜像id（区分即可） 删除镜像
一般先删除有关容器记录，才可以删除对应的镜像
:Error response from daemon: conflict: unable to remove repository reference "lyy/hello:latest" (must force) - container a3ad0c9b4db5 is using its referenced image 821a42dd9ddb
```

#####  2.container

```shell
docker ps                 ===docker container ls    #命令用于列出running容器。  
docker ps -a               ==docker container  ls -a 
                        # 列出running的容器、runned 的容器历史记录。  image 下面是容器id   status
docker rm  容器id          # 删除容器  （从docker ps -a 记录里边删除）
docker rm $(docker ps -aq )    # 删除所有容器     docker ps  -aq     # 直接输出所有容器id 
docker rm $(docker ps -aq -f status=exited) # 删除所有退出容器的记录。
docker ps -a|grep  镜像名  |awk '{print $1}'|xargs docker rm   #删除指定镜像对应的容器记录
# docker ps -a  --format "{{.Image}}  {{.ID}}"|awk '{print $2}'|xargs docker rm

docker run -it centos         #交互式式的伪终端运行镜像
docker start/stop/restart 容器id/names  # 启动（已被停止）的容器/
docker exec -it 5df2d489b17c  /bin/bash  # docker exec 在运行的容器中执行命令
docker exec -it 5df2d489b17c  ip a    python ................................
docker search ubuntu              # Docker Hub 网站来搜索镜像
```

#####  3.Dockerfile

######    3.1 小试牛刀--创建新镜像

```shell
基于一个镜像创建新镜像

# 第一种方法：
docker commit         # 从容器中创建一个新的镜像
例如容器中：yum install -y vim   exit
docker commit musing_pare lyy/centos-vim      # docker -ps -a下面的NAMES  musing_pare 
# image-docker-image  基于某个docker 生成一个新的镜像（这里边就可以使用vim 原来的不可以）

#第二种方法（推荐）：
上面的方法不友好，采用Dockerflie文件临里边写：
FROM centos                                #基于原来的镜像名创建
RUN yum install -y vim
docker build  -t  lyy/centos-vim  
```

###### 3.2 Dockerflie的语法标准

```shell
FROM scratc    # 制作base image
FROM centos     # 使用base image 
FROM ubuntu:14.04  # 使用base image 
```

```shell
LABEL maintainer="144522332059@qq.com"  
LABEL version="1.0"
LABEL description="This is description"
```

```shell
# RUN执行命令并创建新的Image Layer
RUN yum install -y vim   #  &&连接两个命令   \  反斜线换行
RUN yum update && yum install -y vim \ 
python-dev #反斜线换行
```

```shell
# 设定当前工作目录( RUN cd 不推荐 ）、  尽量使用绝对目录
WORKDIR /test  #如果没有test目录 会自动创建test目录
WORKDIR demo
RUN pwd   #输出结果 /test/demo
```

```shell
# ADD和COPY   #添加远程文件请使用curl 、wget。
ADD hello /

ADD test.tar.gz  /         # 添加到根目录并解压

WORKDIR /root
ADD hello test/       # /root/test/hello

WORKDIR /root
COPY hello test/     
```

```shell
# ENV
ENV MYSQL_VERSION 5.6   # 设置常量
RUN apt-get install -y mysql-server="${MYSQL_VERSION}" \
&& rm -rf  /var/lib/apt/lists/*                # 引用常量
```

```shell
# VOLUME  EXPOSE   存储和网络
```

```shell
# CMD 设置容器启动后默认执行的命令和参数  
                            # 多个CMD只有最后一个会被执行
                            # docker run  后面有其他命令，CMD不会被执行。
# ENTRYPOINT 设置容器启动时运行的命令  让容器以应用程序或者服务的形式运行。一定会被执行
                             # ENTRYPOINT ["11.sh"]

# shell 格式
RUN apt-get install -y vim 
CMD echo "hell docker"
ENTRYPOINT echo "hello docker"

# exec 格式
RUN ["apt-get","install","-y","vim"]
CMD ["/bin/echo","hello world"]
ENTRYPOINT ["/bin/bash","-c","echo hello docker"]

# Dockefile 1
FROM centos
ENV name Docker
ENTRYPOINT echo "hello $name"

# Dockefile 2 
FROM centos
ENV name Docker
ENTRYPOINT ["/bin/bash","-c","echo hello $name"]

```

######   3.2 镜像发布

```shell
docker login   # 用户名：liuyuanyuandedocker
docker push liuyuanyuandedocker/hello-demo  # 推送镜像(必须使用liuyuanyuandedocker)
```

###### 3.4 Dockfile实战

```shell
# Dockerfile
```

