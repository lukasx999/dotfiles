xwallpaper --zoom $(cat ~/.wallpaper) &
betterlockscreen --update $(cat ~/.wallpaper) &
picom -b &
xset r rate 300 50 &
nm-applet &
blueman-applet &
gromit-mpx &
dunst &

export QT_QPA_PLATFORMTHEME=qt6ct


exec qtile start
