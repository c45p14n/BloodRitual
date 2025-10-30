#!/bin/bash

get_vol() {
    local change=$1
    case "$change" in
        "up") pamixer -i 1 ;;
        "down") pamixer -d 1;;
        "") echo $(pamixer --get-volume);;
        *) echo "Unrecognized command.";;
    esac
}

get_volicon() {
    local mute=`pamixer --get-mute`
    local vol=`pamixer --get-volume`
    if [[ "$mute" == "true" ]]; then
        echo "󰖁"
      else
        echo "󰕾"
    fi
}

case "$1" in
    "vol") get_vol "$2";;
    "volicon") get_volicon;;
esac
