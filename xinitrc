# -- DWM --
# picom -b &
# xinput set-prop 10 323 1 &
# feh --bg-scale ~/peng.jpg
# xset r rate 300 50 &
# dwmblocks &
# while [ : ]; do dwm; done

# -- GNOME --
# Disable all animations
# gsettings set org.gnome.desktop.interface enable-animations false
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec gnome-session
