#!/usr/bin/env bash
#set -euo pipefail
#set -e



# HW Specs:
kernel=$(uname -r)
cpu=$(lscpu | grep "Model name:" | cut -d' ' -f3- | sed "s_^\s*__g")
cpu_cores=$(lscpu | grep "Core(s) per socket:" | awk '{print $4}')
gpu=$(nvidia-smi | awk 'NR==9' | cut -d' ' -f6-10)
totalvram=$(nvidia-smi | awk 'NR==10 {print $11}' | sed "s/...$//g")
totaldisk=$(df -h | grep "^.*/$" | awk '{print $2}')
totalram=$(free -h | awk 'NR==2 {print $2}' | sed "s/..$//g")
maxclk=$(lscpu | grep "max MHz" | awk '{print $4}' | sed "s;\..*$;;g") # in MHz
resolution_wl=$(wlr-randr | grep current | awk '{print $1}')
refresh_wl=$(wlr-randr | grep current | awk '{print $3}' | sed 's_....$__g')
resolution_x=$(xrandr | grep "*+" | awk '{print $1}')
refresh_x=$(xrandr | grep "*+" | awk '{print $2}' | sed "s_\*.*__g")
mb_vendor=$(cat /sys/devices/virtual/dmi/id/board_vendor)
mb_name=$(cat /sys/devices/virtual/dmi/id/board_name)
mb_all=$(cat /sys/devices/virtual/dmi/id/board_{vendor,name,version})

# Current HW values:

cpu_freq=$(cat /proc/cpuinfo | grep "MHz" | tac | sed 1q | awk '{print $4}') # in MHz
usedvram=$(nvidia-smi | awk 'NR==10 {print $9}' | sed "s/...$//g") # in Mib
percvram=$(( usedvram*100 / totalvram ))
gputemp=$(nvidia-smi | awk 'NR==10 {print $3}' | sed "s/C$//g") # in C
availram=$(free -h | awk 'NR==2 {print $4}' | sed "s/..$//g") # in Gi
usedram=$(free -h | awk 'NR==2 {print $3}' | sed "s/..$//g")
percram=$(echo "$(( $((usedram*100)) / totalram ))" | grep -oE "^..\...|^...\...") # needs to be sourced to work?
availdisk=$(df -h | grep "^.*/$" | awk '{print $4}')
cputemp=$(sensors | grep "Package id 0:" | awk '{print $4}' | sed -e "s/^+//g" -e "s/°C$//g") # in C

# System:

os=$(command cat /etc/os-release | grep "PRETTY_NAME" | grep -o '".*"' | sed 's/"//g')
architechture=$(uname -m)
shell=$(echo $SHELL | cut -d'/' -f3)
packages=$(pacman -Q | wc -l)
packages_avail=$(pacman -Qu | wc -l)
editor=$(echo $EDITOR)
session=$(echo $XDG_SESSION_TYPE)
session_better=$(loginctl show-session $(loginctl | awk 'NR==2{print $1}') -p Type | sed "s_^Type=__g")
terminal=$(basename "/"$(ps -o cmd -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) | tail -1 | sed 's/ .*$//'))
desktop=$(echo $XDG_CURRENT_DESKTOP)
gtk_theme=$(gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g")
cursor_theme=$(cat /usr/share/icons/default/index.theme | sed -e "s/^#.*$//g" -e 's/^\[.*\]$//g' | grep -v "^$" | sed "s_^.*=__g")
cursor_theme_better=$(gsettings get org.gnome.desktop.interface cursor-theme | sed "s/'//g")
icon_theme=$(gsettings get org.gnome.desktop.interface icon-theme | sed "s/'//g")
keymap_x=$(setxkbmap -query | awk 'NR==3 {print $2}')
uptime=$(uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/' | cut -d' ' -f-4 | sed "s/,$//g")
time24h=$(date '+%R')
date=$(date +'%d.%m.%Y')
weekday=$(date +'%A')
user=$(echo $USER)




query=$1
[[ $query ]] && echo "${!query}" && exit 0







echo "Kernel:" $kernel
echo "Cpu:" $cpu
echo "Cpu Cores:" $cpu_cores
echo "Gpu:" $gpu
echo "Totalvram:" $totalvram
echo "Totaldisk:" $totaldisk
echo "Totalram:" $totalram
echo "Maxclk:" $maxclk
echo "Resolution (wl):" $resolution_wl
echo "Refresh (wl):" $refresh_wl
echo "Resolution (x):" $resolution_x
echo "Refresh (x):" $refresh_x
echo "Mb (vendor):" $mb_vendor
echo "Mb (name):" $mb_name
echo "Mb (all):" $mb_all


echo "Cpu_freq:" $cpu_freq
echo "Usedvram:" $usedvram
echo "Percvram:" $percvram
echo "Gputemp:" $gputemp
echo "Availram:" $availram
echo "Usedram:" $usedram
echo "Percram:" $percram
echo "Availdisk:" $availdisk
echo "Cputemp:" $cputemp


echo "OS:" $os
echo "Architechture:" $architechture
echo "Shell:" $shell
echo "Packages:" $packages
echo "Packages (avail):" $packages_avail
echo "Editor:" $editor
echo "Session:" $session
echo "Session (better):" $session_better
echo "Terminal:" $terminal
echo "Desktop:" $desktop
echo "Gtk_theme:" $gtk_theme
echo "Cursor (theme):" $cursor_theme
echo "Cursor_theme_better:" $cursor_theme_better
echo "Icon (theme):" $icon_theme
echo "Keymap (x):" $keymap_x
echo "Uptime:" $uptime
echo "Time24h:" $time24h
echo "Date:" $date
echo "Weekday:" $weekday
echo "User:" $user




