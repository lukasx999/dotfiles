#!/usr/bin/env bash

kbmap=$(hyprctl getoption input:kb_layout | awk 'NR==1 {print $2}')
echo $kbmap
