## 一、安装java

```shell
https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html  
# jdk-8u261-linux-x64.tar.gz
tar -zxvf jdk-8u261-linux-x64.tar.gz 
mv jdk1.8.0_261/ java
mv java/  /usr/local/

vim /etc/profile
export JAVA_HOME=/usr/local/java/jdk1.8.0_171
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

source /etc/profile

ln -s /usr/local/java/bin/java /usr/bin/java

```

