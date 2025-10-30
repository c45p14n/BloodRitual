#!/bin/bash

get_wifi() {
    local wifi=`nmcli con show --active`
    if [[ -z "$wifi" || -z `iwgetid -r` ]]; then
        echo "Disconnected"
    else
        echo `iwgetid -r`
    fi
}

get_wifiicon() {
    local wifi=`nmcli con show --active`
    if [[ -z "$wifi" || -z `iwgetid -r` ]]; then
        echo "󰤮"
    else
        echo "󰤨"
    fi
}

case "$1" in
    "wifi") get_wifi;;
    "wifiicon") get_wifiicon;;
esac
