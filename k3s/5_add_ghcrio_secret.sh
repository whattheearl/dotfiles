#! /bin/bash
kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=$HOME/.docker/ghcrio.json \
    --type=kubernetes.io/dockerconfigjson
