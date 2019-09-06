FROM jboss/wildfly:17.0.1.Final
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
	&& wget https://download.java.net/java/GA/jdk12.0.2/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-12.0.2_linux-x64_bin.tar.gz \
	&& tar zxvf openjdk-12.0.2_linux-x64_bin.tar.gz \
	&& rm -f openjdk-12.0.2_linux-x64_bin.tar.gz
ENV JAVA_HOME=/opt/jdk-12.0.2

WORKDIR /opt/jboss

USER jboss
