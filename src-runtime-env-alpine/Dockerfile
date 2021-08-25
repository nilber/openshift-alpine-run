# golang-alpine
FROM alpine:latest  

RUN apk --no-cache update && apk --no-cache upgrade

RUN addgroup -S 1001 && adduser -S 1001 -G 1001


WORKDIR /opt/app-root/

RUN chown -R 1001:1001 /opt/app-root

USER 1001

# TODO: Set the default port for applications built using this image
EXPOSE 8080
