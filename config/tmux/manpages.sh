#!/usr/bin/env bash


mode=$1



selected=$(apropos . | awk '{print $1}' | fzf --reverse --preview="man {}")



if [[ -z $selected ]]; then
    exit 0
fi






if [[ $mode == "window" ]]; then
    read -p "Enter Query: " query
    tmux new-window "unset BAT_THEME; batman $selected"
    tmux rename-window "man $selected"

    if [[ -n $query ]]; then
        tmux send-keys "/$query"
        tmux send-keys Enter
    fi

fi



if [[ -z $mode ]]; then
    unset BAT_THEME # batman doesnt work with special theme
    batman $selected
fi


#if [[ $mode == "v" ]]; then
    #man $selected
    #tmux split-window -l '100%' -h "man $selected"
    #tmux select-layout even-horizontal
    #tmux resize-pane -L 50
#fi




