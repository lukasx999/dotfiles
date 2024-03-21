#!/usr/bin/env bash

#swww img ~/Pictures/wallpapers/wp3.png --transition-type center --transition-step 255 --transition-fps 180
chosen=$(nsxiv -ot ~/Pictures/wallpapers/*) 
type="center" # wave grow center outer wipe random
#swww img $chosen --transition-type center --transition-step 255 --transition-fps 180
swww img $chosen --transition-type $type --transition-step 255 --transition-fps 180
