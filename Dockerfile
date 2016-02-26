FROM centos:7

MAINTAINER George Bolo <gbolo@linuxctl.com>

EXPOSE 80

RUN yum clean all && \
    yum -y install httpd


