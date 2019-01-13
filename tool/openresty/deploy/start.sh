#!/usr/bin/env bash

cd $(dirname $0)
user="tiger"
id $user >& /dev/null
if [ $? -ne 0 ]
then
    adduser $user --home /home/tiger
fi


dev_domain='cat.dev.org'
staging_domain='cat.staging.org'
online_domain='cat.online.org'
port=${PORT0:="80"}
env=${ENV:="dev"}
modify_file="/usr/local/openresty/nginx/conf/conf.d/cat"
rm -rf /usr/local/openresty/nginx/conf
cp -r ../tool/conf/ /usr/local/openresty/nginx/conf


sed -i "s,listen 80;,listen $port;,g" $modify_file
#modify domain name
if [ "$env" == "dev" ]
then
    sed -i "s,server_name cat.test.org;,server_name $dev_domain;,g" $modify_file
elif [ "$env" == "staging" ]
then
    sed -i "s,server_name cat.test.org;,server_name $staging_domain;,g" $modify_file
elif [ "$env" == "online" ]
then
    sed -i "s,server_name cat.test.org;,server_name $online_domain;,g" $modify_file
    sed -i '/include include\/test\/\*;/d' $modify_file
fi

openresty

while true
do
	sleep 10000
done
