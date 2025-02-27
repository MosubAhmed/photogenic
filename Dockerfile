FROM rockylinux:8
LABEL maintainer="mosubosama123@gmail.com"

# Update system and install required packages with minimal footprint
RUN dnf update -y --setopt=install_weak_deps=False --setopt=tsflags=nodocs && \
    dnf install -y --setopt=install_weak_deps=False --setopt=tsflags=nodocs httpd zip unzip && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# Add and extract the photogenic template
WORKDIR /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip .
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
