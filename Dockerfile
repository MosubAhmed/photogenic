FROM centos:7
LABEL maintainer="mosubosama123@gmail.com"

# Update repository URLs to use vault.centos.org with correct paths
RUN sed -i \
    -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org/centos/7/os/x86_64|g' \
    /etc/yum.repos.d/CentOS-*.repo && \
    sed -i \
    -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org/centos/7/updates/x86_64|g' \
    /etc/yum.repos.d/CentOS-*.repo

# Import GPG key
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# Install packages with cleanup
RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Add and extract the photogenic template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
