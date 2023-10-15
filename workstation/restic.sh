#! /bin/bash
# https://restic.readthedocs.io/
set -e

export AWS_ACCESS_KEY_ID="$MINIO_ID"
export AWS_SECRET_ACCESS_KEY="$MINIO_KEY"
export RESTIC_PASSWORD="$BACKUP_PWD"

restic -r s3:http://truenas.wte.sh:9000/backup-workstation "$@"