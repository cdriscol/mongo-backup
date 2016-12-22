#!/usr/bin/env bash

# options
MONGO_HOST=${MONGO_HOST:-"127.0.0.1"}
MONGO_PORT=${MONGO_PORT:-"27017"}
BACKUPS_DIR=${BACKUPS_DIR:-"backups"}
MONGODUMP_PATH=${MONGODUMP_PATH:-"mongodump"}
MAX_BACKUPS=${MAX_BACKUPS:-10}

# create dump
TIMESTAMP=`date +%F-%H%M%S`
BACKUP_NAME="dump-$TIMESTAMP"
$MONGODUMP_PATH -h $MONGO_HOST:$MONGO_PORT

# compress backup and remove dump folder
mkdir -p $BACKUPS_DIR
mv dump $BACKUP_NAME
tar -zcvf $BACKUPS_DIR/$BACKUP_NAME.tgz $BACKUP_NAME
rm -rf $BACKUP_NAME

# retain only latest $MAX_BACKUPS
cd $BACKUPS_DIR
ls -t | tail -n +$MAX_BACKUPS | xargs rm --
cd -