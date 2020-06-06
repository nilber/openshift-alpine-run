# golang-alpine
FROM ubuntu:latest  
# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Nilber Vittorazzi <nilber@vittorazzi.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0
ENV DEBIAN_FRONTEND noninteractive

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for run application" \
    io.k8s.display-name="builder 1.0" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="builder " \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

RUN apt update -y && apt upgrade -y \
    && apt-get install vim curl wget ca-certificates openssl libvips libvips-dev -y \
    # git build-essential libxml2-dev libfftw3-dev \
	# libmagickwand-dev libopenexr-dev liborc-0.4-0 \
	# gobject-introspection libgsf-1-dev \
	# libglib2.0-dev liborc-0.4-dev autotools-dev \
    # make gtk-doc-tools automake -y \
    # && git clone https://github.com/libvips/libvips.git \
    # && cd libvips \
    # && ./autogen.sh \
    # && make -j$(nproc)\
    # && make install \
    # #&& cd .. && rm -fr libvips \
    # && curl -s https://raw.githubusercontent.com/h2non/bimg/master/preinstall.sh | bash - \    
    && apt-get clean && apt autoremove -y

#RUN apt-get install --reinstall libgtk2.0-0 -y

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
RUN mkdir -p /usr/libexec/
COPY ./s2i/bin/ /usr/libexec/s2i
RUN ls -l /usr/libexec/s2i

RUN usermod -l 1001 www-data \
    && usermod -u 1001 1001 \
    && groupadd -g 1001 1001 && usermod -a -G 1001 1001


WORKDIR /opt/app-root/

RUN chown -R 1001:1001 /opt/app-root

USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080 60001 50051

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
