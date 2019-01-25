#!/usr/bin/env bash

cd $(dirname $0)
cd build/src
wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
cd -

docker build -t  go .
