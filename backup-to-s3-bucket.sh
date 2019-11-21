#! /bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")

printf $SCRIPT_PATH
printf "\n\nSyncing contents in /backups to s3://confluence-backup.marcuschiu.com\n"

aws s3 sync $SCRIPT_PATH/backups/ s3://confluence-backup.marcuschiu.com/

timedatectl | grep "Local time: " > $SCRIPT_PATH/last-backup.txt

printf "\n"
