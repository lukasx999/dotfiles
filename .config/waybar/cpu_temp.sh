#!/usr/bin/env bash

fetch=$(sensors | grep "Package id 0" | awk '{print $4}')
sub=${fetch//.0°C}
temp=${sub//+}

echo $fetch | sed "s_^+__g" | sed 's;°C$;;g' | sed "s;\..$;;g"

#if [[ $temp < 40 ]] then
  #echo  $fetch
#fi



#if [[ $temp > 40 && $temp < 60 ]] then
  #echo  $fetch
#fi



#if [[ $temp > 60 && $temp < 80 ]] then
  #echo  $fetch
#fi



#if [[ $temp > 80 ]] then
  #echo  $fetch
#fi
