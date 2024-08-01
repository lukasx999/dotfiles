#!/usr/bin/env bash

mode=$1
level=$(cat .zoomlevel || echo "1" > .zoomlevel)

val=1 # only in steps of 1 for pypr
inc=$(( level+val ))
dec=$(( level-val ))
(( dec<1 )) && dec=1

#[[ $mode == "inc" ]] && pypr zoom $inc && echo $inc > .zoomlevel
#[[ $mode == "dec" ]] && pypr zoom $dec && echo $dec > .zoomlevel
#[[ $mode == "res" ]] && pypr zoom 1 && echo 1 > .zoomlevel

hyprctl keyword misc:cursor_zoom_rigid false

if [[ $mode == "inc" ]]; then
  hyprctl keyword misc:cursor_zoom_factor $inc 1>/dev/null
  echo $inc > .zoomlevel
  inctxt=$((inc*10))
  notify-send -i zoom -u "normal" -t 1 -a "zoom" -h int:value:${inctxt}  "Zoom Increased"
fi


if [[ $mode == "dec" ]]; then
  hyprctl keyword misc:cursor_zoom_factor $dec 1>/dev/null
  echo $dec > .zoomlevel
  dectxt=$((inc*10))
  notify-send -i zoom -u "normal" -t 1 -a "zoom" -h int:value:${dectxt}  "Zoom Decreased"
fi


if [[ $mode == "res" ]]; then
  hyprctl keyword misc:cursor_zoom_factor 1 1>/dev/null
  echo 1 > .zoomlevel
  restxt=$((inc*10))
  notify-send -i zoom -u "normal" -t 1 -a "zoom" -h int:value:${restxt}  "Zoom Reset"
fi



#notify-send -i zoom -u "normal" -t 1 -a "zoom" -h int:value:20  "Zoom Increased"
