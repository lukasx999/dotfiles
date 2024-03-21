#!/usr/bin/env bash




clients=$(hyprctl clients | grep -E "floating|class" | grep -vE "Window")


for i in $clients
do
  echo "$i"
done
