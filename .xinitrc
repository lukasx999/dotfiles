#!/bin/sh



#         _       _ _            
#   __  _(_)_ __ (_) |_ _ __ ___ 
#   \ \/ / | '_ \| | __| '__/ __|
#    >  <| | | | | | |_| | | (__ 
#   /_/\_\_|_| |_|_|\__|_|  \___|



. ~/.setwallpaper


#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
dunst &
pipewire &
pipewire-pulse &
xrandr -s 0 &
setxkbmap de &
picom -b &
xset r rate 300 50 &
unclutter --timeout 5 --jitter 20 --start-hidden &
xinput set-prop 9 'libinput Accel Speed' -0.6 &
#xwallpaper --zoom ~/Pictures/wallpapers/wallpaper6.jpg &
#redshift -l 48.210033:16.363449 &
conky -d &
redshift &
nm-applet &
blueman-applet &

#dwmblocks &
#exec dwm
#exec awesome

exec qtile start
