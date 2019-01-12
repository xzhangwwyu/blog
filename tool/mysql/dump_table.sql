#!/usr/bin/env bash


HOST="10.8.60.50"
PORT="23306"
DBNAME="escloud_transcoding"
DBUSER="root"
PASSWD="123456"

data_dir="./data/"

mysqldump -h$HOST -P$PORT -u$DBUSER -p$PASSWD --no-data $DBNAME  >$data_dir/${DBNAME}_schema_$(date "+%Y-%m-%d_%H-%M").sql
mysqldump -h$HOST -P$PORT -u$DBUSER -p$PASSWD --no-create-info $DBNAME  >$data_dir/${DBNAME}_data_$(date "+%Y-%m-%d_%H-%M").sql
