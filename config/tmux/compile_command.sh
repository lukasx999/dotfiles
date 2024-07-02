#!/usr/bin/env bash


commands_file="$HOME/.config/tmux/commands.txt"
filename_file="$HOME/.config/tmux/filename.txt"



cwd=$(tmux display-message -p -F "#{pane_current_path}" -t1)



NC='\033[0m' # No Color
Blue='\033[0;34m'
Black='\033[0;30m'
Grey='\033[0;90m'
Red='\033[0;31m'
Green='\033[0;32m'




arg=$1

if [[ $arg == "set-command" ]]; then

    # Get compile command
    # commands=$(cat $commands_file)
    # selection=$(echo "$commands" | fzf --print-query --border-label=" 󰈞 Compile Command  " --algo=v2 --cycle --reverse)

    # query=$(echo $selection | sed 's_\s.*$__')
    # preset=$(echo $selection | sed 's_^.*\s__')

    # if [[ -n $preset ]]; then  # checks if not empty
    #     sel=$preset
    # else
    #     sel=$query
    # fi


    # echo -e $sel >> $commands_file
    # sed -i '/^$/d' $commands_file  # Remove blank lines
    # awk -i inplace '!seen[$0]++' $commands_file  # Remove duplicate lines


    # Get command
    read -p "Compile command: " command

    if [[ -z $command ]]; then
        command=$(cat $commands_file)
    fi

    echo $command > $commands_file
    echo $cwd >> $commands_file




    # fzfselection=$(ls $cwd | fzf --border-label=" 󰈞 File Selection  " --algo=v2 --cycle --reverse)
    #
    # if [[ -z $fzfselection ]]; then
    #     read -p "Filename: " readselection
    #     filename=$readselection
    # else
    #     filename=$fzfselection
    # fi
    #
    #
    #
    # echo ${cwd}/$filename > $filename_file




fi


if [[ $arg == "run-command" ]]; then



    command=$(sed 1q $commands_file)
    path=$(awk 'NR==2' $commands_file)


    cd $path


    echo -e ${Grey}Running${Blue} \`$command\` ${NC}"\n"


    echo $command | bash


    echo -e ${Blue}"\nCompilation finished!"${NC}"\n"

    # tput civis  # hides cursor
    # read -p ""
    read -n 1 -s -r
    # tput cnorm  # show cursor


fi


