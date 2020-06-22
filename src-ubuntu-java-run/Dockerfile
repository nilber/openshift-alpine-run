FROM ubuntu:latest

LABEL maintainer="Nilber Vittorazzi <nilber@vittorazzi.com>"

ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for run application" \
    io.k8s.display-name="midleware 1.1" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="midleware" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

RUN apt-get update -y && \
	apt-get install -y openjdk-8-jre vim curl wget && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;
	
# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Setup JAVA_HOME, this is useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME



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
EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
