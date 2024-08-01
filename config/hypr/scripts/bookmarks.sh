#!/usr/bin/env bash

bmpath=~/.bookmarks


list=$(cat $bmpath)
#list=$(cat $bmpath | sed 's_\s#.*$__g') # for comment support

headerlist=$(echo "$list" | grep -o "^%.*%$" | sed -e "s_^%__g" -e 's_%$__g')
#selectedheader=$(echo "$headerlist" | wofi --dmenu --prompt='Category') || exit 0
selectedheader=$(echo "$headerlist" | rofi -dmenu) || exit 0


category=$(echo "$selectedheader" | sed -e "s_^_%_g" -e 's_$_%_g')
entrylist=$(echo "$list" | awk 'f==0 && /.*/{print} /^%.*%$/{f=1} /'$category'/{print f=0}' | grep -vxE "0|^%.*%$" | sed 's_\s:\s.*$__g')
#selectedentry=$(echo "$entrylist" | wofi --dmenu --prompt='Bookmarks')
selectedentry=$(echo "$entrylist" | rofi -dmenu)


copyvalue=$(echo "$list" | grep "$selectedentry\s:\s" | sed "s_^.*\s:\s__g")
copyvalue=$(echo "$copyvalue" | sed 's_\\n_\n_g') # for newlines
echo "$copyvalue" | wl-copy -n


# TODO: add multi line support for .bookmarks file!





# add icons
#echo -en "myentry\0icon\x1ffirefox\n" | rofi -dmenu
