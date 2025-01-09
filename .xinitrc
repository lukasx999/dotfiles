# -- Qtile --
# xwallpaper --zoom $(cat ~/.wallpaper) &
# betterlockscreen --update $(cat ~/.wallpaper) &
# picom -b &
# xset r rate 300 50 &
# nm-applet &
# blueman-applet &
# # gromit-mpx &
# dunst &
# export QT_QPA_PLATFORMTHEME=qt6ct
# exec qtile start

# -- DWM --
# picom -b &
# xinput set-prop 10 323 1 & # Invert touchpad
# xwallpaper --zoom $(cat ~/.wallpaper) &
# xset r rate 300 50 &
# exec dwm
# while [ : ]; do dwm; done

# -- GNOME --
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session
