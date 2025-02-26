# Use a specific version of CentOS
FROM centos:7

# Add maintainer label
LABEL maintainer="mosubosama123@gmail.com"

# Update repositories and install dependencies
RUN yum update -y && \
    yum install -y httpd \
    zip \
    unzip && \
    yum clean all

# Download and add website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Unzip and deploy the template
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose ports 80 (HTTP) and 22 (SSH)
EXPOSE 80 22

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
