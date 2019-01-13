#!/usr/bin/env bash
set -e

echo "======test post_req"

cd $(dirname $0)
host="cat.dev.org"
port="8080"
url="${host}:8080/test_post_req"

curl -XPOST "${url}" -H "host:${host}" -d 'a=b&b=c'
curl -XPOST "$url" -H "host:${host}" -H "Content-Type:application/json" -d '{"user": "admin", "passwd":"12345678"}'
echo "======end post_req"
