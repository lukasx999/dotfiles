#!/usr/bin/env bash


kbmap=$(hyprctl getoption input:kb_layout | awk 'NR==1 {print $2}')

[[ $kbmap == "de" ]] && hyprctl keyword input:kb_layout us && notify-send -i flag "KB Layout changed to: us" && pkill -RTMIN+1 waybar
[[ $kbmap == "us" ]] && hyprctl keyword input:kb_layout de && notify-send -i flag "KB Layout changed to: de" && pkill -RTMIN+1 waybar


