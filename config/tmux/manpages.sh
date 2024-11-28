#!/usr/bin/env bash


mode=$1


sectionlist=$(
cat << 'END_HEREDOC'
1\tExecutable programs or shell commands\n
2\tSystem calls\n
3\tLibrary calls\n
4\tSpecial files\n
5\tFile formats and conventions\n
6\tGames\n
7\tMiscellaneous\n
8\tSystem administration commands\n
9\tKernel routines\n
END_HEREDOC
)

section=$(echo -e $sectionlist | fzf --reverse | cut -f1)
[[ -z $section ]] &&  a="" || a="-s $section"


selected=$(apropos  . | awk '{print $1}' | fzf --reverse --preview="man $section {}")

if [[ -z $selected ]]; then
    exit 0
fi


if [[ $mode == "window" ]]; then
    read -p "Enter Query: " query
    tmux new-window "unset BAT_THEME; batman $section $selected"
    tmux rename-window "man $section $selected"

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




