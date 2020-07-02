##                                                                                               nginx使用说明

#### 一、**环境准备**

1、firewall-cmd    --state  防火墙

2、systemctl   disable   firewalld.service 禁止开机自启动防火墙    关闭selinux

```linux
systemctl list-unit-files    //查看所有可用单元（disable||active）
yum list
rpm -qa  列出所有安装过的包
   -ivh 显示安装进度  
   -ivh --test 用来检查依赖关系，并不是真正安装。
   -ql  安装详情


```

3、yum -y install gcc gcc-c++ autoconf  pcre pcre-devel make automake

4、yum -y install wget httpd-tools vim

5、cd /opt;mkdir app download logs work backup

6、iptables  -F 关闭规则      iptables -t nat -F    L是查看  F是关闭

###### 6、rpm -ivh http://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.14.2-1.el7_4.ngx.x86_64.rpm

###### 7、 ps -A | grep nginx  kill   然后重启nginx，访问192.168.3.4：80

#### 二、基础学习

  1、/etc/nginx/nginx.conf       /usr/sbin/nginx             /usr/share/nginx/html    

  4、**主配置文件**                                           **cgi配置相关**

​     /etc/nginx                                        /etc/nginx/fastcgi_params  

​    **/etc/nginx/nginx.conf**                               /etc/nginx/scgi_params

​    /etc/nginx/conf.d                                    /etc/nginx/uwsgi_params 

​    /etc/nginx/conf.d/default.conf                   

​    **编码转换映射转化文**件                             **nginx日志轮转、用于logrotate.d服务的日志切割**

​    /etc/nginx/koi-utf                                      /etc/logrotate.d/nginx

​    /etc/nginx/koi-win                                 **设置http协议的Content-Type与扩展名所对应关系**

​    /etc/nginx/win-utf                                            /etc/nginx/mime.types

 **用于配置系统守护进程管理器管理方式**                               **nginx模块目录**

  /usr/lib/systemd/system/nginx-debug.service                       /etc/nginx/modules   

 /usr/lib/systemd/system/nginx.service                             /usr/lib64/nginx/modules

  /etc/sysconfig/nginx                                           **nginx启动管理的终端命令**

 /etc/sysconfig/nginx-debug                                          **/usr/sbin/nginx**  

​                                                                    /usr/sbin/nginx-debug 

​      **nginx手册帮助文件**                                               **nginx缓存目录**

 /usr/share/doc/nginx-1.14.2                                         /var/cache/nginx

/usr/share/doc/nginx-1.14.2/COPYRIGHT                                 **日志目录**

/usr/share/man/man8/nginx.8.gz                                        /var/log/nginx



 /usr/share/nginx   

/usr/share/nginx/html 

/usr/share/nginx/html/50x.html

/usr/share/nginx/html/index.html 

/usr/lib64/nginx   /usr/libexec/initscripts/legacy-actions/nginx
/usr/libexec/initscripts/legacy-actions/nginx/check-reload
/usr/libexec/initscripts/legacy-actions/nginx/upgrade

5、nginx  -V  查看nginx安装详情

 systemctl restart/start/stop nginx.service   重启nginx

 systemctl status nginx.service    查看服务状态

 systemctl reload nginx.service  重新读取配置文件，不用停止nginx服务

  nginx -t  语法正确检测   -s   reload         、

  nginx  -t -c /etc/nginx/nginc.conf     

  nginx -s reload -c  /etc/nginx/nginx.conf

 6、ip a 查看网卡 ，网卡绑定的ip    ifconfig

 7、基于虚你主机 多域名配置   /etc/hosts ==>  ping lyy.com  

#### 三、安装node 

cd /u01/install    

wget -c https://nodejs.org/dist/v10.1.0/node-v10.1.0-linux-x64.tar.gz

tar -xvf node-v10.1.0-linux-x64.tar.gz 

mv node-v10.1.0-linux-x64 nodejs    rm -rf node-v10.1.0-linux-x64.tar.gz 

sudo ln -s /u01/install/nodejs/bin/npm  /usr/local/bin/npm

sudo ln -s /u01/install/nodejs/bin/node /usr/local/bin/node

node -v    npm -v







