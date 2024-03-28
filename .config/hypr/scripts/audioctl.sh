#!/usr/bin/env bash

mode=$1


[[ $mode == "inc" ]] && wpctl set-volume @DEFAULT_SINK@ 0.1+ && pkill -RTMIN+2 waybar
[[ $mode == "dec" ]] && wpctl set-volume @DEFAULT_SINK@ 0.1- && pkill -RTMIN+2 waybar
[[ $mode == "mute" ]] && wpctl set-mute @DEFAULT_SINK@ toggle && pkill -RTMIN+2 waybar
