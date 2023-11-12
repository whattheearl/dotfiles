#! /bin/bash
# https://restic.readthedocs.io/
set -e

export AWS_ACCESS_KEY_ID="$MINIO_ID"
export AWS_SECRET_ACCESS_KEY="$MINIO_KEY"
export RESTIC_PASSWORD="$BACKUP_PWD"

restic -r s3:http://truenas.wte.sh:9000/backup-workstation \
    --exclude="*node_module*" \
    --exclude="*.docker/buildx*" \
    --exclude="*out*" \
    --exclude="*.var*" \
    --exclude="*bin*" \
    --exclude="*.angular*" \
    --exclude="*.sveltekit*" \
    --exclude="*cache*" \
    --exclude="*/tmp/*" \
    --verbose \
    backup ~/

restic -r s3:http://truenas.wte.sh:9000/backup-workstation \
    --verbose \
    forget \
    --keep-daily 7 \
    --keep-weekly 4 \
    --keep-monthly 12 \
    --keep-yearly 7
    

