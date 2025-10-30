#!/bin/bash

get_temp()
{
    echo `sensors | grep Core | awk '{print substr($3, 2, 2)}' | awk '{ tot+=$1;cnt++ } END { print int(tot/cnt) }'`
}

case "$1" in
    "temp") get_temp;;
esac
