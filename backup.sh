#! /bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")

printf "\n\nSyncing contents in /var/atlassian/application-data/confluence/backups to local\n"

rsync -avzh /var/atlassian/application-data/confluence/backups $SCRIPT_PATH/

$SCRIPT_PATH/backup-to-s3-bucket.sh
