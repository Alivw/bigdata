FROM jalivv/jdk18:1.0.0

# 镜像的作者  
 MAINTAINER jalivv


# add hadoop
ADD hadoop-2.6.5.tar.gz /usr/local
ENV HADOOP_HOME /usr/local/hadoop

#add hive
ADD hive-2.3.9.tar.gz /usr/local/
RUN mv /usr/local/hive-2.3.9 /usr/local/hive
ENV HIVE_HOME /usr/local/hive

COPY mysql-connector-java-8.0.29.jar /usr/local/hive/lib/ 
ENV PATH $PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HIVE_HOME/bin:$HADOOP_HOME/sbin
CMD ["/usr/sbin/sshd", "-D"]

