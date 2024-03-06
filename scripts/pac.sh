#!/bin/sh



actions=$(echo -e "\
Install\n\
Remove\n\
Update\n\
Upgrade\
")


optionselect=$(<<< $actions fzf --height 5%)

[[ $optionselect = "Install" ]] && pacman -Slq | fzf --ansi --scroll-off=5 --preview-window=right --scheme=path --cycle --algo=v2 -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
[[ $optionselect = "Remove" ]] && pacman -Qq | fzf -m --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
[[ $optionselect = "Update" ]] && sudo pacman -Sy
[[ $optionselect = "Upgrade" ]] && sudo pacman -Syu









