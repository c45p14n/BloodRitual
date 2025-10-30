#!/bin/bash

WALLPAPERS_DIR="$HOME/Wallpapers/"
build_theme() {
    rows=$1
    cols=$2
    icon_size=$3

    echo "element{orientation:vertical;}element-text{horizontal-align:0.5;}element-icon{size:300px;}listview{lines:3;columns:1;}"
}

theme="$HOME/.config/rofi/wallpaper/style.rasi"

ROFI_CMD="rofi -dmenu -i -show-icons -theme-str $(build_theme 3 5 6) -theme ${theme}"

choice=$(\
    ls --escape "$WALLPAPERS_DIR" | \
        while read A; do echo -en "$A\x00icon\x1f$WALLPAPERS_DIR/$A\n"; done | \
        $ROFI_CMD -p "󰸉  Wallpaper" \
)

wallpaper="$WALLPAPERS_DIR/$choice"
   swww img -t any --transition-bezier 0.0,0.0,1.0,1.0 --transition-duration 1 --transition-step 255 --transition-fps 60 "$wallpaper" && \
    ln -sf "$wallpaper" "$WALLPAPERS_DIR"/current.wall
exit 1

