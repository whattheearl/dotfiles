#! /bin/bash
set -e

export NODE1="192.168.88.11"
export NODE2="192.168.88.12"
export NODE3="192.168.88.13"

k3sup install \
    --cluster \
    --context default \
    --user root \
    --ssh-key $HOME/.ssh/wte \
    --k3s-extra-args '--disable traefik' \
    --ip $NODE1 \
    --local-path ~/.kube/config \
    --merge \
    --skip-install

k3sup ready \
  --context default \
  --kubeconfig ~/.kube/config

k3sup join \
    --user root \
    --ssh-key $HOME/.ssh/wte \
    --k3s-extra-args '--disable traefik' \
    --ip $NODE2 \
    --server-user root \
    --server-ip $NODE1 \
    --print-command \
    --server

k3sup ready \
  --context default \
  --kubeconfig ~/.kube/config

k3sup join \
    --user root \
    --ssh-key $HOME/.ssh/wte \
    --k3s-extra-args '--disable traefik' \
    --ip $NODE3 \
    --server-user root \
    --server-ip $NODE1 \
    --print-command \
    --server