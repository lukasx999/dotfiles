#!/usr/bin/env bash

res=$(wlr-randr | grep current | awk '{print $1}')

selection=$(echo -e "copy to clipboard\nwhole screen\nselection to file" | wofi --columns=1 --dmenu --prompt='Screenshot Options')

sleep 0.5



[[ $selection == "selection to file" ]] && grim -g "$(slurp)" $(xdg-user-dir PICTURES)/screenshots/$(date +'%s_grim.png')
[[ $selection == "whole screen" ]] && grim -g "0,0 $res" $(xdg-user-dir PICTURES)/screenshots/$(date +'%s_grim.png')
[[ $selection == "copy to clipboard" ]] && grim - | wl-copy

