#!/bin/sh
#
#
#
#
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠒⠒⠂⠀⠤⠤⠤⣄⣀⡀⠘⢆⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⡿⠋⣀⣔⣒⣉⣀⠤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⣀⣀⡤⠤⠤⠄⠀⠒⠒⠒⠒⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣉⣽⢾⡇⠀⠀⠀⠀⠀⢰⣿⣟⣵⣿⢿⣿⣛⣿⣿⣻⢿⣦⠤⠀⠀⠀⠀⠀⠀⠀⠠⣾⢾⣍⣁⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠶⠛⠋⠉⠁⠀⢠⡏⠀⠀⠀⠀⠰⣲⡿⡟⠋⢹⣿⠟⠛⠉⠉⠙⢻⣗⢻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⠀⠉⠉⠛⠳⠶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⢀⣤⠶⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠁⢀⡴⠋⠀⠀⠀⠀⠀⢀⠿⣿⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡆⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠶⢦⣀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⢀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣟⣿⡟⣿⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢦⡀⠀⠀⠀
#                ⠀⠀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣶⣿⣾⣾⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡄⠀
#                ⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠖⠚⠛⣛⠻⢧⣤⣤⣄⣀⡠⣤⣤⣶⣶⣶⣾⣿⣿⣳⣝⣿⡿⣻⣽⢺⣿⣿⣿⣶⣶⣶⡤⣀⣤⣤⣤⠟⢛⡛⠛⠒⠶⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄
#                ⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠀⠀⠀⠀⡴⠁⠀⠀⠀⠉⠉⠛⠛⠾⠯⣟⣻⡿⠿⣟⣯⣿⣿⣷⣿⣿⡇⡏⣻⣿⣟⡿⠯⠗⠛⠋⠉⠁⠀⠀⠀⠱⡄⠀⠀⠀⠈⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧
#                ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣾⣯⣹⣷⣝⢿⣿⣿⣻⣵⣏⣿⣧⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸
#                ⢸⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠯⣷⣿⣿⣿⣷⣷⣿⣿⣽⣸⡯⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⢸
#                ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡉⠩⡏⡏⣟⢿⡿⣿⣽⣇⡯⠉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⢸
#                ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⡇⣿⣷⣿⣿⢿⠏⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸
#                ⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⢶⣶⢄⠀⠀⢠⣾⢻⣿⣽⣯⣿⣸⣸⣿⣆⠀⠀⣠⢴⣶⢶⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆
#                ⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⣾⣯⣿⢸⣷⣄⣴⣯⡺⣝⡿⡿⣿⣽⡿⣻⣶⢀⣾⣧⢿⡞⣿⣽⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁
#                ⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠟⠈⠇⠀⠙⢿⣯⠟⠀⢏⣿⣿⣿⡟⣇⠹⢿⣿⠟⠁⠸⠃⠸⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀
#                ⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠘⣼⣽⣿⣦⣿⠀⠈⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣟⣿⣯⡼⡧⣴⣶⣿⠿⠿⠿⠿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡜⡿⡿⣫⣻⡝⠒⠉⠉⠈⠈⠉⠉⠘⠙⢿⣿⣏⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⢿⠟⠘⣿⣿⣗⣻⣦⡀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢧⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠲⣤⣀⣀⣀⣀⣀⣠⣤⣶⣾⡿⠿⠛⠉⠀⠀⠀⠀⠀⢺⣿⣷⣝⢿⣶⣄⣀⡀⠀⠠⢴⣿⣽⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢿⣶⣝⡿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#
#
#
#
#
#
#
#
#
#                                      __                           _     
#                                     / _|_   _ _________   _   ___| |__  
#                                    | |_| | | |_  /_  / | | | / __| '_ \ 
#                                    |  _| |_| |/ / / /| |_| |_\__ \ | | |
#                                    |_|  \__,_/___/___|\__, (_)___/_| |_|
#                                                       |___/             
#
#
#
#
#
#
#
#






# Usage: $ fuzzy <dir> <filter>
# default dir: /
# if the filter flag is selected, no filters will be applied (longer loading time)

# Allows you to fuzzy find all files on the system on then opens files with corresponding programs

# ToDo:
# Icons: maybe use xargs file and [[ ... ]] and then sed with regex?
# Sort Files
# add better filtering
# fix /home/ and . issue
# show most recent files first FIXED, kinda
# show "startpage": user can put in their most used files that will be shown at startup -- maybe at file list like $config and then run diff?
# -type f takes a bit longer at startup and then gets faster -- maybe run the script silently at boot? timeout 5 ~/scripts/fuzzy.sh
# bat error "#filter: ..." no such file or directory FIXED
# previews dont work when substituting /home/usr for ~ FIXED
# bugged previews for # commands





#config=$(echo -e "#search in cwd\n#search in /\n#toggle filter\n#filter on\n#filter off") # possibly "\" ?






# colors
NC='\033[0m' # No Color
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White





config=$(echo -e "\
${Yellow}#search in .\n\
#search in /\n\
#search in ~\n\
#filter: default\n\
#filter: none\n\
#filter: only dirs${NC}\
") # possibly "\" ?




# Add your most used dires/files here, to make them show up on start

recent=$(echo -e "\
${Red}/home/$USER/scripts/fuzzy.sh${NC}\n\
${Cyan}/home/$USER/scripts${NC}\n\
${Cyan}/home/$USER/.zshrc${NC}\n\
${Cyan}/home/$USER/.xinitrc${NC}\n\
${Cyan}/home/$USER/.config${NC}\n\
${Cyan}/home/$USER/.config/qtile/config.py${NC}\n\
${Cyan}/home/$USER/.config/nvim${NC}\n\
${Cyan}/home/$USER/.config/picom${NC}\
")

ignore=$(echo $recent | sed -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g")



#recent=$(find $dir -type f -maxdepth 8 -mount -printf "%T@ %p\n" 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}' | sort -n | tail -n 50 | cut -d' ' -f 2-)






dir=$1
[[ "$dir" = "" ]] && dir="/"

filter=$2
[[ "$filter" = "" ]] && filter="default"




# -type f for regular files --- 50 is max char limit --- awk is for removing duplicate lines like uniq but you dont have to sort
# type f will not show dirs such as / or /etc


[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 8 -mount 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | grep -Evx "$ignore" | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --ansi --scroll-off=5 --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s@^~@/home/$USER@g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s@^~@/home/$USER@g" | xargs bat -p --color=always 2>/dev/null' | sed "s@^~@/home/$USER@g")



[[ "$filter" = "none" ]] && selection=$(cat <(echo $recent) <(find $dir 2>/dev/null) <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --ansi --scroll-off=5 --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s@^~@/home/$USER@g" | xargs file | cut -d" " -f 2- && echo "" && echo {} | sed "s@^~@/home/$USER@g" | xargs bat -p --color=always 2>/dev/null' | sed "s@^~@/home/$USER@g")




[[ "$filter" = "onlydir" ]] && selection=$(cat <(echo $recent | sed 1q) <(find $dir -maxdepth 8 -mount -type d 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --ansi --scroll-off=5 --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s@^~@/home/$USER@g" | xargs file | cut -d" " -f 2- && echo "" && echo {} | sed "s@^~@/home/$USER@g" | xargs bat -p --color=always 2>/dev/null' | sed "s@^~@/home/$USER@g")







# show most recent files first

#[[ "$filter" = "default" ]] && selection=$(cat <(find $dir -maxdepth 8 -mount -type f -printf '%T@ %p\n' 2>/dev/null | sort -k 1nr | sed 's/^[^ ]* //' | tr '\0' '\n' | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null')





# PROBLEM: using full path instead of . will add more chars and therefore limit search results

#[[ "$dir" != "/home/lukas" ]] && [[ "$filter" = "filter" ]] && selection=$(cat <(find $dir -maxdepth 8 -mount 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null')

# compensating for /home/lukas => 10 extra chars
#[[ "$dir" = "/home/lukas" ]] && [[ "$filter" = "filter" ]] && selection=$(cat <(find $dir -maxdepth 8 -mount 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{60,}') <(echo $config) | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null')




# legacy code
#[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 8 -mount -type f 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null')

#[[ "$filter" = "onlydir" ]] && selection=$(cat <(find $dir -maxdepth 8 -mount -type d 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null')

#[[ "$filter" = "none" ]] && selection=$(cat <(find $dir 2>/dev/null) <(echo $config) | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null')


#[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 8 -mount -type f 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' | sed "s@^~@/home/$USER@g")

#[[ "$filter" = "none" ]] && selection=$(cat <(echo $recent) <(find $dir 2>/dev/null) <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' | sed "s@^~@/home/$USER@g")


#[[ "$filter" = "onlydir" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 8 -mount -type d 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' | sed "s@^~@/home/$USER@g")





[[ "$selection" = "" ]] && return 0

filetype=$(file $selection | awk '{print $2}') # type of file (2nd column of find)
dirpath=$(echo $selection | rev | cut -d'/' -f2- | rev) # full path without last element (ie.: /etc/pacman.conf -> /etc)

filename=$(basename -- "$selection") # file name without full path
extension="${filename##*.}" # file extension (no .)
filename="${filename%.*}"




#symlinks
#[[ "$filetype" = "symbolic" ]] && cd $selection && return 0

# directories
[[ "$filetype" = "directory" ]] && cd $selection && return 0

# images
[[ "$filetype" = "PNG" ]] || [[ "$filetype" = "JPEG" ]] && cd $dirpath && $IMGVIEWER $selection && return 0

# file extensions (txt)
[[ "$extension" = "c" ]] || [[ "$extension" = "py" ]] || [[ "$extension" = "cpp" ]] || [[ "$extension" = "sh" ]] && cd $dirpath && $EDITOR $selection && return 0

# pdfs
[[ "$extension" = "pdf" ]] && cd $dirpath && $PDFVIEWER $selection && return 0

# text files
[[ "$filetype" = "Unicode" ]] || [[ "$filetype" = "Python" ]] || [[ "$filetype" = "ASCII" ]] && cd $dirpath && $EDITOR $selection && return 0

# shell scripts
shebang=$(command cat $selection 2>/dev/null | sed 1q | grep ^\#!)
[[ "$shebang" != "" ]] && cd $dirpath && $EDITOR $selection && return 0

# executables
[[ -x "$selection" ]] && $selection && return 0





# settings

# switch to current working dir
[[ "$selection" = "#search in ." ]] && fuzzy . $filter && return 0
[[ "$selection" = "#search in /" ]] && fuzzy / $filter && return 0
[[ "$selection" = "#search in ~" ]] && fuzzy ~ $filter && return 0


# filters

[[ "$selection" = "#filter: none" ]] && fuzzy $dir none && return 0
[[ "$selection" = "#filter: default" ]] && fuzzy $dir default && return 0
[[ "$selection" = "#filter: only dirs" ]] && fuzzy $dir onlydir && return 0







