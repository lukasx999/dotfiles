#!/usr/bin/env bash


input=$(./voice2text.sh)
echo $input




start=$(echo $input | grep -oE "start|launch|open" | xargs)

[[ $start ]] && [[ $(echo $input | grep -oE "firefox") ]] && firefox & disown 2>/dev/null
[[ $start ]] && [[ $(echo $input | grep -oE "browser") ]] && $BROWSER & disown 2>/dev/null
[[ $start ]] && [[ $(echo $input | grep -oE "terminal") ]] && $TERMINAL & disown 2>/dev/null


