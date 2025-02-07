#!/usr/bin/env bash
set -uo pipefail

PREFIX="$HOME/.config"
FILES="nvim tmux kitty gdb clangd alacritty"

file_list=$(echo $FILES | tr ' ' '\n')

function deploy {
    for file in $file_list; do
        path=${PREFIX}/${file}

        if [[ -d $path ]]; then
            echo "$path already exists"
        else
            ln -srv $file $path
        fi

    done
}

function remove {
    echo "$file_list" | xargs -I{} rm -v ${PREFIX}/{}
}



if [[ $# == 0 ]]; then
	deploy
elif [[ $# == 1 && $1 == "remove" ]]; then
	remove
else
	echo "Invalid number of arguments"
	exit 1
fi
