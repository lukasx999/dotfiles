#!/usr/bin/env bash
set -euo pipefail

base=~/code/repos
repo=$(ls $base | fzf)
path=$base/$repo

if ! [[ -f $path/.tmuxp.yaml ]] then
    echo tmuxp session file does not exist in $path
    exit 1
fi

tmuxp load $path
