FROM centos:7

MAINTAINER George Bolo <gbolo@linuxctl.com>

EXPOSE 80 443

# -----------------------------------------------------------------------------
# Import the RPM GPG key for Default Centos 7 Repository
# -----------------------------------------------------------------------------
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7


# -----------------------------------------------------------------------------
# Set apache UID/GID
# -----------------------------------------------------------------------------
RUN groupadd apache -g 2001 && \
    useradd -r apache -u 2001 -g 2001

# -----------------------------------------------------------------------------
# Update & Install apache
# -----------------------------------------------------------------------------
RUN yum -y update && \
    yum -y install httpd && \
    yum clean all

# -----------------------------------------------------------------------------
# run apache, make sure to rm pid before starting it
# -----------------------------------------------------------------------------
COPY httpd-foreground /usr/local/bin/
CMD ["httpd-foreground"]
