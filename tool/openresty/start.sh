#!/usr/bin/env bash
set -ex

cd $(dirname $0)

base_dir=$(pwd)
project_name="common_openresty"
image_version="openresty"

exec_file="/opt/tiger/openresty/deploy/start.sh"
PORT0=8080

map_port="\
-p $PORT0:$PORT0 \
"
map_file="\
-v $base_dir/ignore_data:/var/log/nginx \
-v $base_dir:/opt/tiger/openresty \
"
env_var="\
	-e ENV=dev \
	-e PORT0=$PORT0 \
"

ret=$(docker image ls |grep "$image_version"|wc -l)

if [ $ret -eq 0 ]
then
	echo "not have $image_version"
	$base_dir/docker/start.sh
fi


dockerid=$(docker ps -a |grep $project_name|awk '{print $1}')
case $1 in
start)
	echo "start $project_name ......"
	docker run --name "$project_name" -d $env_var $map_file $map_port $image_version "$exec_file"
	;;
stop)
	echo "stop $project_name ......"
	docker stop $dockerid
	;;
restart)
	echo "restart $project_name ......"
	docker exec -t $dockerid bash -c "ps -ef |grep nginx|grep -v grep|awk '{print \$2}'|xargs kill -9;$exec_file"
	;;
reload)
	echo "reload $project_name ......"
	docker exec -t $dockerid bash -c "/usr/local/openresty/bin/openresty -s reload"
	;;
indocker)
	echo "indocker $project_name ......"
	docker exec -it $dockerid bash
	;;
remove)
	echo "remove $project_name ......"
	docker stop $dockerid
	docker rm $dockerid
	;;
*)
	echo -e "usage:\n\tstart start $project_name\n\tremove remove $project_name"
esac
	


