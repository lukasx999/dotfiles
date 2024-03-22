#!/usr/bin/env bash

swww query || swww init

wpdir=~/Pictures/wallpapers


random=$(echo $RANDOM | sed "s;...$;;g")

counter=0
while read line; do 
  imgarray[$counter]=$line
  let counter=counter+1
done < <(ls $wpdir)


imgpath=$(echo ${wpdir}/${imgarray[$random]})


type="random" # center
swww img "$imgpath" --transition-type $type --transition-step 255 --transition-fps 180 --transition-bezier .54,0,.34,.99 --transition-duration 2 --filter Mitchell

swww query || swww init

echo "wallpaper"
