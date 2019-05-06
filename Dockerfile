FROM jboss/wildfly:16.0.0.Final
MAINTAINER marcin.zaremba@gmail.com

USER root

RUN localedef -i pl_PL -c -f UTF-8 -A /usr/share/locale/locale.alias pl_PL.UTF-8
ENV LANG pl_PL.UTF-8
ENV LANGUAGE pl_PL:pl
ENV LC_ALL pl_PL.UTF-8

RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

WORKDIR /opt
RUN yum install wget -y \
	&& wget https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz \
	&& tar zxvf openjdk-12.0.1_linux-x64_bin.tar.gz \
	&& rm -f openjdk-12.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME=/opt/jdk-12.0.1

WORKDIR /opt/jboss

USER jboss
