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

### 二、docker学习

 1.images 镜像

```shell
vim /etc/docker/daemon.json
{"registry-mirrors":["https://almtd3fa.mirror.aliyuncs.com"] } # 添加重启docker，加速下载image镜像文件。

https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors # only for me
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
```



```shell
docker container ls      #命令用于列出running容器。  
docker container  ls -a   # 列出running的容器、runned 的容器历史记录。  image 下面是容器id   status
docker search ubuntu   # Docker Hub 网站来搜索镜像
docker run -it centos  #交互式式的伪终端运行镜像
source .bashrc   #新建的镜像添加ll  
dircolors -p > .dircolors  # DIR 34 改为35  添加系统颜色

```

