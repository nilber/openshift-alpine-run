# golang-alpine
FROM ubuntu:latest  
# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Nilber Vittorazzi <nilber@vittorazzi.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0
ENV DEBIAN_FRONTEND noninteractive


RUN apt update -y && apt upgrade -y \
    && apt-get install vim curl wget ca-certificates openssl libvips libvips-dev -y \   
    && apt-get clean && apt-get clean all && apt autoremove -y

RUN usermod -l 1001 www-data \
    && usermod -u 1001 1001 \
    && groupadd -g 1001 1001 && usermod -a -G 1001 1001


WORKDIR /opt/app-root/

RUN chown -R 1001:1001 /opt/app-root

USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080
