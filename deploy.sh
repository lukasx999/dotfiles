#!/usr/bin/env bash
set -uo pipefail

PREFIX="$HOME/.config"
FILES="nvim tmux"


file_list=$(echo $FILES | tr ' ' '\n')



function deploy {
    echo "$file_list" | xargs -I{} ln -sr {} ${PREFIX}/{} 2>/dev/null
    if [[ $? == 0 ]]; then
        echo "$file_list" | xargs -I{} echo "created symlink to {} at ${PREFIX}/{}"
    else
        echo "$file_list" | xargs -I{} echo "symlink to {} already exists at ${PREFIX}/{}"
    fi
}

function remove {
    echo "$file_list" | xargs -I{} rm ${PREFIX}/{}
    echo "$file_list" | xargs -I{} echo "removed symlink to {} at ${PREFIX}/{}"
}



if [[ $# == 0 ]]; then
	deploy
elif [[ $# == 1 && $1 == "remove" ]]; then
	remove
else
	echo "Invalid number of arguments"
	exit 1
fi
