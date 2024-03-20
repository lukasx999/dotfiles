#!/usr/bin/env bash

mode=$1
level=$(cat .zoomlevel)

val=1
inc=$(( level+val ))
dec=$(( level-val ))
(( dec<1 )) && dec=1

[[ $mode == "inc" ]] && pypr zoom $inc && echo $inc > .zoomlevel
[[ $mode == "dec" ]] && pypr zoom $dec && echo $dec > .zoomlevel
[[ $mode == "res" ]] && pypr zoom 1 && echo 1 > .zoomlevel

#hyprctl keyword misc:cursor_zoom_rigid false
#[[ $mode == "inc" ]] && hyprctl keyword misc:cursor_zoom_factor $inc && echo $inc > .zoomlevel
#[[ $mode == "dec" ]] && hyprctl keyword misc:cursor_zoom_factor $dec && echo $dec > .zoomlevel
#[[ $mode == "res" ]] && hyprctl keyword misc:cursor_zoom_factor 1 echo 1 > .zoomlevel
