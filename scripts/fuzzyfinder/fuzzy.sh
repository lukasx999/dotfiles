#!/bin/sh




########################################################################################################
#                                                                                                      #
#                                                                                                      #
#                                                                                                      #
#                     _/_/                                                        _/                   #
#                  _/      _/    _/  _/_/_/_/  _/_/_/_/  _/    _/        _/_/_/  _/_/_/                #
#               _/_/_/_/  _/    _/      _/        _/    _/    _/      _/_/      _/    _/               #
#                _/      _/    _/    _/        _/      _/    _/          _/_/  _/    _/                #
#               _/        _/_/_/  _/_/_/_/  _/_/_/_/    _/_/_/  _/  _/_/_/    _/    _/                 #
#                                                          _/                                          #
#                                                     _/_/                                             #
#                                                                                                      #
#                                                                                                      #
#                                                                                                      #
########################################################################################################






# Usage: $ fuzzy <dir> <filter>

# Allows you to fuzzy find all files on the system (or specified dir) and then opens files with corresponding programs


# FEATURES: 
# * filtering
# * icons
# * shows recently editited files or user defined list
# * colors
# * file explorer mode


# DEPENDENCIES:
# * fzf
# * kitty, sixel, iterm (for images)
# * bat (for text previews)
# * eza (for icons)
# * xsel (for copying to clipboard)
# * fd


# Issues:
# * when txt file is already opened it will show the prompt twice
# * PROBLEM: using full path instead of . will add more chars and therefore limit search results
# * Move file previews over to fzf-preview.sh
# * Icons
# * Sort Files
# * Show most recent files
# * add better filtering
# * fix /home/ and . issue
# * bugged previews for # commands
# * flickering









# Colors

NC='\033[0m' # No Color
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White



# Settings

config=$(echo -e "\
${Yellow}#search in .\n\
#search in /\n\
#search in ~\n\
#run with fzy\n\
#show a compact prompt\n\
#copy the file path\n\
#filter: default\n\
#filter: icons\n\
#filter: only dirs\n\
#filter: none${NC}\
")




# Add your most used dirs/files here, to make them show up on start

recent=$(echo -e "\
${Red}/home/$USER/scripts/fuzzyfinder/fuzzy.sh${NC}\n\
${Cyan}/home/$USER/scripts${NC}\n\
${Cyan}/home/$USER/.zshrc${NC}\n\
${Cyan}/home/$USER/.xinitrc${NC}\n\
${Cyan}/home/$USER/.dotfiles/packages${NC}\n\
${Cyan}/home/$USER/.config${NC}\n\
${Cyan}/home/$USER/.config/qtile/config.py${NC}\n\
${Cyan}/home/$USER/.config/nvim${NC}\n\
${Cyan}/home/$USER/.config/picom/picom.conf${NC}\n\
${Cyan}/home/$USER/.config/rofi/config.rasi${NC}\
")

ignore=$(<<< "$recent" sed -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g")









# Change default options

dir=$1
[[ "$dir" ]] || dir="/"

filter=$2
#[[ "$filter" ]] || filter="default"
[[ "$filter" ]] || filter="fd"



# -u ... unrestricted -a always absolute path (even in .) -d id maxdepth -g is glob matching -c is color always/never/auto -j 14 is threads

[[ "$filter" = "fd" ]] && selection=$(<<< "$recent" < <(fd -uag -d 7 -c never "*" "$dir" | grep -vEi "^$PWD$|/run/|/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}") <<< "$config" awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -vx "$ignore" | sed "s;$HOME;~;g" | fzf --ansi --scroll-off=5 --height 100% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | sed "s;^~;$HOME;g")



[[ "$filter" = "default" ]] && selection=$(<<< "$recent" < <(find "$dir" -maxdepth 7 -mount 2>/dev/null | grep -vEi "^$PWD$|/run/|/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}") <<< "$config" awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -vx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --height 60% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | sed "s;^~;/home/$USER;g")











[[ "$filter" = "explore" ]] && selection=$(< <(<<< " ..") < <(find "$dir" -maxdepth 1 2>/dev/null | sed "s;^\./;;" | grep -Evx "^\." | xargs -L 1 eza -d --icons=always 2>/dev/null)  awk '!a[$0]++' | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --height 100% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | cut -d" " -f 2- | sed "s;^;$PWD/;" | sed "s;^~;/home/$USER;g")

[[ $selection =~ ".* -> .*" ]] && selection=$(<<< $selection | cut -d" " -f 3-) # symlinks
[[ "$filter" = "explore" ]] && [[ $selection = ".." ]] && cd .. && fuzzy . explore && return 0
[[ $selection = ".." ]] || [[ "$filter" = "explore" ]] && [[ $(file $selection | awk '{print $2}') = "directory" ]] && cd $selection && fuzzy . explore && return 0





[[ "$filter" = "copypath" ]] && selection=$(< <(<<< "$recent") < <(find "$dir" -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') < <(<<< "$config") awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --height 100% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | sed "s;^~;/home/$USER;g" | tr -d '\n') && <<< "$selection" | xsel -b && <<< "$selection" && return 0






[[ "$filter" = "icons" ]] && selection=$(< <(<<< "$recent") < <(find "$dir" -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}' | xargs -L 1 eza -d --icons=always 2>/dev/null) < <(<<< "$config") awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --height 100% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | cut -d" " -f 2- | sed "s;^~;/home/$USER;g")






[[ "$filter" = "none" ]] && selection=$(< <(<<< "$recent") < <(find "$dir" 2>/dev/null) < <(<<< "$config") awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --height 100% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | sed "s;^~;/home/$USER;g")



[[ "$filter" = "onlydir" ]] && selection=$(< <(<<< "$recent") < <(find "$dir" -maxdepth 7 -type d -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') < <(<<< "$config") awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --height 100% --preview-window=right --scheme=path --cycle --algo=v2 --preview='~/scripts/fuzzyfinder/fzf-preview.sh {}' | sed "s;^~;/home/$USER;g")















[[ "$selection" ]] || return 0

filetype=$(file $selection | awk '{print $2}') # type of file (2nd column of find)
dirpath=$(<<< $selection rev | cut -d'/' -f2- | rev) # full path without last element (ie.: /etc/pacman.conf -> /etc)

filename=$(basename -- "$selection") # file name without full path
extension="${filename##*.}" # file extension (no .)
filename="${filename%.*}"





# directories
[[ "$filetype" = "directory" ]] && cd $selection && return 0

# images
[[ "$filetype" =~ "PNG|JPEG|JPG" ]] && cd $dirpath && $IMGVIEWER $selection && return 0

# file extensions (txt)
[[ "$extension" =~ "c|py|lua|cpp|sh|hs|rs|go" ]] && cd $dirpath && $EDITOR $selection && return 0

# pdfs
[[ "$extension" = "pdf" ]] && cd $dirpath && $PDFVIEWER $selection && return 0

# text files
[[ "$filetype" =~ "Unicode|Python|ASCII" ]] && cd $dirpath && $EDITOR $selection && return 0

# shell scripts
shebang=$(command cat $selection 2>/dev/null sed 1q | grep ^\#!) #cmd cat instead of < because of errors with settings

[[ "$shebang" ]] && cd $dirpath && $EDITOR $selection && return 0

# executables
[[ -x "$selection" ]] && $selection && return 0





# settings
[[ "$selection" = "#search in ." ]] && fuzzy . $filter && return 0
[[ "$selection" = "#search in /" ]] && fuzzy / $filter && return 0
[[ "$selection" = "#search in ~" ]] && fuzzy ~ $filter && return 0

# filters
[[ "$selection" = "#filter: none" ]] && fuzzy $dir none && return 0
[[ "$selection" = "#filter: default" ]] && fuzzy $dir default && return 0
[[ "$selection" = "#run with fzy" ]] && fuzzy $dir fzy && return 0
[[ "$selection" = "#show a compact prompt" ]] && fuzzy $dir compact && return 0
[[ "$selection" = "#copy the file path" ]] && fuzzy $dir copypath && return 0
[[ "$selection" = "#filter: icons" ]] && fuzzy $dir icons && return 0
[[ "$selection" = "#filter: only dirs" ]] && fuzzy $dir onlydir && return 0







