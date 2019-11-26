#!/bin/bash

DOCKER_IMAGEM=alpine-run
S2I_IMAGEM=nbmaster/openshift-alpine-run
TAG=1.0

docker system prune
docker rmi $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker build src/ -t $DOCKER_IMAGEM:$TAG

s2i build src/ $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker push $S2I_IMAGEM:$TAG