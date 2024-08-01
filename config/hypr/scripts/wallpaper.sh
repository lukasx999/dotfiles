#!/usr/bin/env bash

swww query || swww init

#swww img ~/Pictures/wallpapers/wp3.png --transition-type center --transition-step 255 --transition-fps 180
chosen=$(nsxiv -ot ~/Pictures/wallpapers/*) 
type="center" # wave grow center outer wipe random
#swww img $chosen --transition-type center --transition-step 255 --transition-fps 180
# --transition-pos
#swww img $chosen --transition-type $type --transition-step 255 --transition-fps 180 --transition-bezier .54,0,.34,.99 --transition-duration 2 --filter Mitchell
swww img $chosen --transition-type $type --transition-step 255 --transition-fps 255 --transition-duration 0.7 --filter Mitchell --transition-bezier .43,1.19,1,.4 --invert-y

swww query || swww init
