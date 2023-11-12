#! /bin/bash
set -e
cd "$(dirname "$0")"

sops --encrypt --age ${SOPS_AGE_RECIPIENTS}  cloudflare-secret.yaml > cloudflare-secret.enc.yaml
