#!/usr/bin/env bash


vol=$(wpctl get-volume @DEFAULT_SINK@ | sed "s_^.*: __g")

mutevol=$(grep -o "MUTED" <(echo $vol))
[[ $mutevol == "MUTED" ]] && echo "MUTED" && exit 0


perc=$(echo "$vol * 100" | bc -l | sed 's_\..*$__g')
echo ${perc}%


