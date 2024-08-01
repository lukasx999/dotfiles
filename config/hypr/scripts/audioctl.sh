#!/usr/bin/env bash

mode=$1


getvol(){
vol=$(wpctl get-volume @DEFAULT_SINK@ | sed "s_^.*:\s__g")
perc=$(echo "$vol * 100" | bc -l | sed 's_\..*$__g')
}



if [[ $mode == "inc" ]]; then
  wpctl set-volume @DEFAULT_SINK@ 0.1+
  getvol
  pkill -RTMIN+2 waybar
  makoctl dismiss -n
  notify-send -i speaker -u "low" -t 1 -a "audioctl" -h int:value:${perc}  "Volume Incremented"
fi



if [[ $mode == "dec" ]]; then
  wpctl set-volume @DEFAULT_SINK@ 0.1-
  getvol
  pkill -RTMIN+2 waybar
  notify-send -i speaker -u "low" -t 1 -a "audioctl" -h int:value:${perc}  "Volume Decremented"
fi



if [[ $mode == "mute" ]]; then
  wpctl set-mute @DEFAULT_SINK@ toggle
  getvol
  pkill -RTMIN+2 waybar
  notify-send -i speaker -u "low" -t 1 -a "audioctl" -h int:value:${perc}  "Volume Muted"
fi



#notify-send -u "normal" -t 1000 -a "test" -h string:syncronous:volume -h int:value:50  "test"
#notify-send -i speaker -u "normal" -t 1000 -a "test" -h int:value:50  "test"



#notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i speaker "Volume : ${perc} %"
