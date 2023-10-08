#! /bin/bash
set -e

export AWS_ACCESS_KEY_ID="$MINIO_ID"
export AWS_SECRET_ACCESS_KEY="$MINIO_KEY"

restic -r s3:http://truenas.wte.sh:9000/backup-workstation init