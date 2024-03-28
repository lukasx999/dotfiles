#!/usr/bin/env bash

bmpath=~/.bookmarks


list=$(cat $bmpath)

#echo "$(cat $bmpath)"

echo "$list" | wofi --dmenu | wl-copy -n
