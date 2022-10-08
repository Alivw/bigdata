FROM jalivv/ssh:1.0.0

# 镜像的作者  
 MAINTAINER jalivv


# add hadoop
ADD hadoop-2.6.5.tar.gz /usr/local
ENV HADOOP_HOME /usr/local/hadoop

#add hive
ADD hive-2.3.9.tar.gz /usr/local/
ENV HIVE_HOME /usr/local/hive

# 安装 which
RUN yum -y install which && \
    mv /usr/local/hive-2.3.9 /usr/local/hive && \
# install jre 1.8
    yum -y install java-1.8.0-openjdk.x86_64 

ENV JAVA_HOME /etc/alternatives/jre_1.8.0
ENV PATH $JAVA_HOME/bin:$PATH


COPY mysql-connector-java-8.0.29.jar /usr/local/hive/lib/ 
ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HIVE_HOME/bin:$HADOOP_HOME/sbin

CMD ["/usr/sbin/sshd", "-D"]

