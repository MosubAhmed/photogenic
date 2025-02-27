FROM centos:7
LABEL maintainer="mosubosama123@gmail.com"

# Update base repository URLs to use vault.centos.org
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

# Install required packages
RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all

# Add and extract the photogenic template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
