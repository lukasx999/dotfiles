#!/usr/bin/env bash


workingdir=$(tmux display-message -p -F "#{pane_current_path}" -t1)


NC='\033[0m' # No Color
Blue='\033[0;34m'
Black='\033[0;30m'
Grey='\033[0;90m'
Red='\033[0;31m'
Green='\033[0;32m'


cmddir=/tmp/tmux_compilecmd_cmd
pathdir=/tmp/tmux_compilecmd_path

oldcmd=`cat $cmddir`
cwd=`cat $pathdir`


shellcmd="run-shell 'echo \"%1\" > $cmddir ; echo "$workingdir" > $pathdir'"

prompt="Compile Command:"

function setcmd {

    if [[ -z "$oldcmd" ]]; then
        tmux command-prompt -T command -p "$prompt" "$shellcmd"
    else
        tmux command-prompt -I "$oldcmd" -T command -p "$prompt" "$shellcmd"
    fi

    return 0

}

function run {

    cd $cwd

    echo -e ${Grey}Running${Blue} \`$oldcmd\` ${Grey}in ${Blue}\`$cwd\` ${NC}"\n"

    echo "$oldcmd" | bash

    echo -e ${Blue}"\nCompilation finished!"${NC}"\n"

    # tput civis  # hides cursor
    # read -p ""
    read -n 1 -s -r

    return 0

}


arg=$1

if [[ $arg == "set-command" ]]; then
    setcmd
fi


if [[ $arg == "run-command" ]]; then
    run
fi


