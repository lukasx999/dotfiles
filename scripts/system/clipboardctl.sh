#!/usr/bin/env bash


clipboardpath=~/.clipboard

mode=$1


# daemon
[[ $mode == "daemon" ]] && wl-paste -w wl-paste -n | xargs >> $clipboardpath


# menu
[[ $mode == "menu" ]] && tac $clipboardpath | awk '!a[$0]++' | grep -v "^$" | wofi --columns=1 --dmenu --prompt='Clipboard History' | wl-copy

