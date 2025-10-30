#!/bin/bash

get_blight() {
    local change=$1
    case "$change" in
        "up") brightnessctl set +1%;;
        "down") brightnessctl set 1%-;;
        "") echo $(brightnessctl | awk '/%/ {print $4}' | tr -d '()%');;
        *) echo "Unrecognized command.";;
    esac
}

get_bliicon() {
        echo "󰛨"
}

case "$1" in
    "bli") get_blight "$2";;
    "bliicon") get_bliicon;;
esac
