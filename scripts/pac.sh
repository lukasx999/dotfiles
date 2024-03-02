#!/bin/sh



actions=$(echo -e "\
Install\n\
Remove\n\
Update\n\
Upgrade\
")


optionselect=$(echo $actions | fzy)


[[ $optionselect = "Install" ]] && pacman -Q | fzf
[[ $optionselect = "Remove" ]] && pacman -Q | fzf
[[ $optionselect = "Update" ]] && pacman -Q | fzf
[[ $optionselect = "Upgrade" ]] && pacman -Q | fzf









