#!/usr/bin/env bash


clipboardpath=~/.clipboard

mode=$1


# daemon
[[ $mode == "daemon" ]] && wl-paste -w wl-paste -n >> $clipboardpath


# menu
[[ $mode == "menu" ]] && sed 20q $clipboardpath | wofi --dmenu --prompt='Clipboard History' | wl-copy


