#!/usr/bin/env bash
set -ex

cd $(dirname $0)
base_dir=$(pwd)
project_name="common_redis"
image_version="redis:4.0.8"

map_port="\
"
map_file="\
-v $base_dir/ignore_data:/redis/data/ \
-v $base_dir/redis.conf:/usr/local/etc/redis/redis.conf \
"
env_var="\
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
	
