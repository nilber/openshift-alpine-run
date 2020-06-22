#!/bin/bash

DOCKER_IMAGEM=run
S2I_IMAGEM=nbmaster/openshift-run
TAG=ubuntu-java

# docker system prune
# docker rmi $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker build src-ubuntu-java-run/ -t $DOCKER_IMAGEM:$TAG

s2i build src-ubuntu-java-run/ $DOCKER_IMAGEM:$TAG $S2I_IMAGEM:$TAG

docker push $S2I_IMAGEM:$TAG