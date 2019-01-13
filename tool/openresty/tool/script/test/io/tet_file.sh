#!/usr/bin/env bash
set -e

echo "======test post_req"

cd $(dirname $0)
host="cat.dev.org"
port="8080"
url="${host}:8080/test_get_conf"

curl -XPOST "${url}" -H "host:${host}" 
echo "======end post_req"
