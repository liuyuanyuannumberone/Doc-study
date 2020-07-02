#                    docker的使用

### 一、docker的安装和使用

https://docs.docker.com/engine/install/centos/   参考官网安装

```linux
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

### 二、





