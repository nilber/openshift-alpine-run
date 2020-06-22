# golang-alpine
FROM openjdk:8-alpine
# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Nilber Vittorazzi <nilber@vittorazzi.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for run application" \
    io.k8s.display-name="midleware 1.1" \
    io.openshift.expose-services="8080:http" \
    io.openshift.tags="midleware" \
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"


RUN apk --no-cache update && apk --no-cache upgrade

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
RUN mkdir -p /usr/libexec/
COPY ./s2i/bin/ /usr/libexec/s2i
RUN ls -l /usr/libexec/s2i

RUN addgroup -S 1001 && adduser -S 1001 -G 1001


WORKDIR /opt/app-root/

RUN chown -R 1001:1001 /opt/app-root

USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
