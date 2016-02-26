FROM centos:7

MAINTAINER George Bolo <gbolo@linuxctl.com>

EXPOSE 80 443

# -----------------------------------------------------------------------------
# Import the RPM GPG key for Default Centos 7 Repository
# -----------------------------------------------------------------------------
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

# -----------------------------------------------------------------------------
# Install apache
# -----------------------------------------------------------------------------
RUN yum -y install httpd \
    yum clean all

# -----------------------------------------------------------------------------
# run apache, make sure to rm pid before starting it
# -----------------------------------------------------------------------------

COPY httpd-foreground /usr/local/bin/
CMD ["httpd-foreground"]
