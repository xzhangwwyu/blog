#!/usr/bin/env bash
set -e

echo "======test get_req"

cd $(dirname $0)
host="cat.dev.org"
port="8080"
url="${host}:8080/test_get_req?a=b&b=c"

curl "$url" -H "host:${host}"
echo "======end get_req"
