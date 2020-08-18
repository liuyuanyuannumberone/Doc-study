#### Tomcat的安装

```shell
wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.tar.gz
tar -zxvf apache-tomcat-8.5.57.tar.gz  -C /usr/local/
cd bin/   ./startup.sh   默认8080端口

如果启动出错，进行如下配置
firewall-cmd --zone=public --add-port=8080/tcp --permanent
systemctl restart  firewalld.service
firewall-cmd --reload

添加用户：配置Web管理账号
cd conf/; vim tomcat-users.xml
<tomcat-users>
<user name="admin" password="passok" roles="admin-gui,manager-gui">
</tomcat-users>
配置端口
vim /usr/local/tomcat/conf/server.xml
<Connector port="8888" protocol="HTTP/1.1" connectionTimeout="20000"   redirectPort="8443" />
```

```shell
·bin     //存放Tomcat的命令脚本文件
·conf    //存放Tomcat服务器的各种配置文件,最主要是server.xml
·lib     //存放Tomcat服务器支撑jar包
·logs    //存放日志文件
·temp    //存放临时文件
·webapps //web应用所在目录，外界访问web资源的存放目录
·work    //Tomcat的工作目录
```

