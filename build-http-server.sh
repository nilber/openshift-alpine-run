#!/bin/bash

DOCKER_IMAGEM=alpine-run
S2I_IMAGEM=nbmaster/openshift-alpine-run
TAG=http-server

# docker system prune
# docker rmi $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker build src-http-server/ -t $DOCKER_IMAGEM:$TAG

s2i build src-http-server/ $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker push $S2I_IMAGEM:$TAG