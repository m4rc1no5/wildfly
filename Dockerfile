FROM jboss/wildfly:14.0.1.Final
MAINTAINER marcin.zaremba@gmail.com

USER root

WORKDIR /opt
RUN yum install wget -y \
	&& wget https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz \
	&& tar zxvf openjdk-11_linux-x64_bin.tar.gz \
	&& rm -f openjdk-11_linux-x64_bin.tar.gz
ENV JAVA_HOME=/opt/jdk-11
WORKDIR ~/

RUN localedef -i pl_PL -c -f UTF-8 -A /usr/share/locale/locale.alias pl_PL.UTF-8
ENV LANG pl_PL.UTF-8
ENV LANGUAGE pl_PL:pl
ENV LC_ALL pl_PL.UTF-8

RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
