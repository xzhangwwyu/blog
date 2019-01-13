#!/usr/bin/env bash

cd $(dirname $0)/../../
base=$(pwd)

export LUA_PATH="$base/?.lua;"

lua test/file/getcwd.lua
