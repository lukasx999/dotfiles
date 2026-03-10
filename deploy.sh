#!/usr/bin/env bash
set -uo pipefail

remove=false

if [[ $# == 1 && $1 == "remove" ]]; then
    remove=true
fi

deploy() {
    file=$1
    path=$2

    if $remove; then
        rm -v $path
        return
    fi

    ln -srv $file $path
}

deploy "nvim"          ~/.config/nvim
deploy "tmux"          ~/.config/tmux
deploy "kitty"         ~/.config/kitty
deploy "gdb"           ~/.config/gdb
deploy "clangd"        ~/.config/clangd
deploy "alacritty"     ~/.config/alacritty
deploy "hypr"          ~/.config/hypr
deploy "waybar"        ~/.config/waybar
deploy "emacs"         ~/.config/emacs
deploy "mimeapps.list" ~/.config/mimeapps.list
deploy "zsh/zshrc"     ~/.zshrc
deploy "zsh/plugins"   ~/.zsh_plugins
deploy "sqliterc"      ~/.sqliterc
