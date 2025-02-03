#!/usr/bin/env bash
set -euo pipefail

PREFIX="$HOME/.config"

function deploy {
    ln -sr nvim ${PREFIX}/nvim
}

function remove {
	rm ${PREFIX}/nvim
}


if [[ $# == 0 ]]; then
	deploy
elif [[ $# == 1 && $1 == "remove" ]]; then
	remove
else
	echo "Invalid argument"
	exit 1
fi
