#!/usr/bin/env bash

cd $(dirname $0)
ret=`find ./|grep sh|grep -v start`

for exe in $ret
do
	$exe
done
