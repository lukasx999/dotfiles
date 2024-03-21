#!/usr/bin/env bash
#
# The purpose of this script is to demonstrate how to preview a file or an
# image in the preview window of fzf.
#
# Dependencies:
# - https://github.com/sharkdp/bat
# - https://github.com/hpjansson/chafa
# - https://iterm2.com/utilities/imgcat

if [[ $# -ne 1 ]]; then
  >&2 echo "usage: $0 FILENAME"
  exit 1
fi

file=${1/#\~\//$HOME/}
type=$(file --dereference --mime -- "$file")



function filetype(){
  echo $1 | sed "s.^~./home/$USER.g" | xargs file | cut -d" " -f 2-
}


function textpreview(){
  $2 -p --color=always $1 2>/dev/null
}

function filesize(){
  echo $1 | sed "s.^~./home/$USER.g" | xargs du -hc 2>/dev/null | tail -n 1 | awk '{print $1}'
}

function fileinfo(){
  echo $1 | xargs | eza -F -lh --icons=auto --color=always --group-directories-first "$file"
}


  if [[ $type =~ /directory ]]; then
    filetype "$file"
    filesize "$file"
    echo ""
    #eza -F -lh --icons=auto --color=always --group-directories-first "$file"
    echo $1 | xargs | eza -F -lhd --icons=auto --color=always --group-directories-first "$file"
    echo ""
    fileinfo "$file"
    exit
  fi




if [[ ! $type =~ image/ ]]; then
  if [[ $type =~ =binary ]]; then
    filetype "$file"
    filesize "$file"
    echo ""
    fileinfo "$file"
    #file "$1"
    exit
  fi


  if [[ $file =~ ^#.* ]]; then
    echo "settings"
    exit
  fi


  # Sometimes bat is installed as batcat.
  if command -v batcat > /dev/null; then
    batname="batcat"
  elif command -v bat > /dev/null; then
    batname="bat"
  else
    cat "$1"
    exit
  fi

  filetype "$file"
  filesize "$file"
  echo ""
  fileinfo "$file"
  echo ""
  textpreview "$file" "${batname}"
  #echo $file | sed "s;^~;/home/$USER;g" | xargs file | cut -d" " -f 2-
  #${batname} -p --color=always $file | grep -v "cannot open"
  #${batname} --style="${BAT_STYLE:-numbers}" --color=always --pager=never -- "$file"
  #file $file
  exit
fi








dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
if [[ $dim = x ]]; then
  dim=$(stty size < /dev/tty | awk '{print $2 "x" $1}')
elif ! [[ $KITTY_WINDOW_ID ]] && (( FZF_PREVIEW_TOP + FZF_PREVIEW_LINES == $(stty size < /dev/tty | awk '{print $1}') )); then
  # Avoid scrolling issue when the Sixel image touches the bottom of the screen
  # * https://github.com/junegunn/fzf/issues/2544
  dim=${FZF_PREVIEW_COLUMNS}x$((FZF_PREVIEW_LINES - 1))
fi

# 1. Use kitty icat on kitty terminal
if [[ $KITTY_WINDOW_ID ]]; then
  # 1. 'memory' is the fastest option but if you want the image to be scrollable,
  #    you have to use 'stream'.
  #
  # 2. The last line of the output is the ANSI reset code without newline.
  #    This confuses fzf and makes it render scroll offset indicator.
  #    So we remove the last line and append the reset code to its previous line.
  kitty icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no --place="$dim@0x0" "$file" | sed '$d' | sed $'$s/$/\e[m/'
  echo ""
  filetype "$file"
  filesize "$file"
  echo ""
  fileinfo "$file"

# 2. Use chafa with Sixel output
elif command -v chafa > /dev/null; then
  chafa -f sixel -s "$dim" "$file"
  # Add a new line character so that fzf can display multiple images in the preview window
  echo

# 3. If chafa is not found but imgcat is available, use it on iTerm2
elif command -v imgcat > /dev/null; then
  # NOTE: We should use https://iterm2.com/utilities/it2check to check if the
  # user is running iTerm2. But for the sake of simplicity, we just assume
  # that's the case here.
  imgcat -W "${dim%%x*}" -H "${dim##*x}" "$file"

# 4. Cannot find any suitable method to preview the image
else
  file "$file"
fi
