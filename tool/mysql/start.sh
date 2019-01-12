#!/usr/bin/env bash
set -ex

cd $(dirname $0)
base_dir=$(pwd)
project_name="common_mysql"
image_version="mysql:5.7"
passwd="52b005fe8ae56dde565efb798bc02c83"

map_port="\
"
map_file="\
-v $base_dir/ignore_data:/var/lib/mysql \
-v $base_dir/mysqld.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf \
"
env_var="\
-e MYSQL_ROOT_PASSWORD=$passwd \
"

dockerid=$(docker ps -a |grep $project_name|awk '{print $1}')
case $1 in
start)
	echo "start $project_name ......"
	docker run --name "$project_name" -d --net=host $env_var $map_file $map_port $image_version
	;;
stop)
	echo "stop $project_name ......"
	docker stop $dockerid
	;;
remove)
	echo "remove $project_name ......"
	docker stop $dockerid
	docker rm $dockerid
	;;
*)
	echo -e "usage:\n\tstart start $project_name\n\tremove remove $project_name"
esac
	
