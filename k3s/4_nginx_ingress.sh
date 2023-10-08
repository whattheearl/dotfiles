#! /bin/bash

# https://kubernetes.github.io/ingress-nginx/deploy/#quick-start
# traefik must be disabled

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace