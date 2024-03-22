#!/usr/bin/env bash


#bordersize=$(grep "border_size" ~/.config/hypr/hyprland.conf | cut -d' ' -f7)
bordersize=$(hyprctl getoption general:border_size | grep "int" | awk '{print $2}')

while true; do
windows=$(hyprctl activeworkspace | grep "windows" | awk 'NR==1' | cut -d' ' -f2)
(( windows<2 )) && hyprctl keyword general:border_size 0 1>/dev/null || hyprctl keyword general:border_size $bordersize 1>/dev/null
done
