#!/usr/bin/env bash
set -uo pipefail

PREFIX="$HOME/.config"
FILES="nvim tmux kitty gdb clangd alacritty"

file_list=$(echo $FILES | tr ' ' '\n')

function deploy {
    file=$1
    path=$2

    if [[ -d $path ]]; then
        echo "$path already exists"
    else
        ln -srv $file $path
    fi
}

function deploy_all {
    for file in $file_list; do
        path=${PREFIX}/${file}
        deploy $file $path
    done
    deploy "zsh/zshrc" "$HOME/.zshrc"
    deploy "zsh/plugins" "$HOME/.zsh_plugins"
}

function remove {
    echo "$file_list" | xargs -I{} rm -v ${PREFIX}/{}
    rm -v "~/.zshrc" "~/.zsh_plugins"
}


if [[ $# == 0 ]]; then
    deploy_all
elif [[ $# == 1 && $1 == "remove" ]]; then
    remove
else
    echo "Invalid number of arguments"
    exit 1
fi
