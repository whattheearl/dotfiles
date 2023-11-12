#! /bin/bash
set -e
cd "$(dirname "$0")"

sops -d cloudflare-secret.enc.yaml > cloudflare-secret.yaml