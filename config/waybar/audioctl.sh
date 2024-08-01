#!/usr/bin/env bash


vol=$(wpctl get-volume @DEFAULT_SINK@ | sed "s_^.*: __g")

mutevol=$(grep -o "MUTED" <(echo $vol))
[[ $mutevol == "MUTED" ]] && echo '󰝟' "MUTED" && exit 0


perc=$(echo "$vol * 100" | bc -l | sed 's_\..*$__g')
#echo ${perc}


(( perc >= 60 )) && echo '󰕾' $perc && exit 0
(( perc < 60 )) && (( perc > 30 )) && echo '󰖀' $perc && exit 0
(( perc <= 30 )) && echo '󰕿' $perc && exit 0



#󰕾
#󰕿
#󰖀
#󰝞
#󰖁
#󰝝
