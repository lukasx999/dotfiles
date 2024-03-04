#!/bin/sh
#
#                              :h-                                  Nhy`               
#                             -mh.                           h.    `Ndho               
#                             hmh+                          oNm.   oNdhh               
#                            `Nmhd`                        /NNmd  /NNhhd               
#                            -NNhhy                      `hMNmmm`+NNdhhh               
#                            .NNmhhs              ```....`..-:/./mNdhhh+               
#                             mNNdhhh-     `.-::///+++////++//:--.`-/sd`               
#                             oNNNdhhdo..://++//++++++/+++//++///++/-.`                
#                        y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       
#                   .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        
#                   h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         
#                   hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        
#                   /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       
#                    oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      
#                     /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     
#                       /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    
#                         .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    
#                         -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   
#                         /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   
#                         //+++//++++++////+++///::--                 .::::-------::   
#                         :/++++///////////++++//////.                -:/:----::../-   
#                         -/++++//++///+//////////////               .::::---:::-.+`   
#                         `////////////////////////////:.            --::-----...-/    
#                          -///://////////////////////::::-..      :-:-:-..-::.`.+`    
#                           :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   
#                             ::::://::://::::::::::::::----------..-:....`.../- -+oo/ 
#                              -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``
#                             s-`::--:::------:////----:---.-:::...-.....`./:          
#                            yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           
#                           oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              
#                          :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                
#                                          .-:mNdhh:.......--::::-`                    
#                                             yNh/..------..`                          
#                                                              
#
#
#
#                          _/_/                                                        _/       
#                       _/      _/    _/  _/_/_/_/  _/_/_/_/  _/    _/        _/_/_/  _/_/_/    
#                    _/_/_/_/  _/    _/      _/        _/    _/    _/      _/_/      _/    _/   
#                     _/      _/    _/    _/        _/      _/    _/          _/_/  _/    _/    
#                    _/        _/_/_/  _/_/_/_/  _/_/_/_/    _/_/_/  _/  _/_/_/    _/    _/     
#                                                               _/                              
#                                                          _/_/                                 
#
#
#
#
#
#
#
#
#






# Usage: $ fuzzy <dir> <filter>

# Allows you to fuzzy find all files on the system and then opens files with corresponding programs

# Issues:
# Icons
# Sort Files
# Show most recent files
# add better filtering
# fix /home/ and . issue
# bugged previews for # commands
# flickering



# FEATURES: 
# * filtering
# * icons
# * shows recently editited files or user defined list
# * colors


# DEPENDENCIES:
# * fzf
# * kitty, sixel, iterm (for images)
# * bat (for text previews)
# * eza (for icons)
# * xsel (for copying to clipboard)




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
#run with fzy\n\
#show a compact prompt\n\
#copy the file path\n\
#filter: default\n\
#filter: icons\n\
#filter: only dirs\n\
#filter: none${NC}\
") # possibly "\" ?




# Add your most used dirs/files here, to make them show up on start

recent=$(echo -e "\
${Red}/home/$USER/scripts/fuzzy.sh${NC}\n\
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

ignore=$(echo $recent | sed -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g")





dir=$1
[[ "$dir" = "" ]] && dir="/"

filter=$2
#[[ "$filter" = "" ]] && filter="default"
#[[ "$filter" = "" ]] && filter="compact"
[[ "$filter" = "" ]] && filter="default"






function fuzzyfind(){

input=$(</dev/stdin)

[[ $1 ]] || echo $input | fzf --ansi --scroll-off=5 --preview-window=right --scheme=path --cycle --algo=v2 --preview='echo {} | cut -d" " -f 2- | xargs /home/$USER/scripts/fzf-preview.sh && echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null'


[[ $1 = "compact" ]] && echo $input | fzf --ansi --scroll-off=5 --preview-window=right --height 60% --scheme=path --cycle --algo=v2 --preview='echo {} | cut -d" " -f 2- | xargs /home/$USER/scripts/fzf-preview.sh && echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null' 

}





# type f will not show dirs such as / or /etc






[[ "$filter" = "default" ]] && selection=$(< <(echo $recent) < <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') < <(echo $config) | awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --preview-window=right --scheme=path --cycle --algo=v2 --preview='echo {} | cut -d" " -f 2- | xargs /home/$USER/scripts/fzf-preview.sh && echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null' | sed "s;^~;/home/$USER;g")






[[ "$filter" = "compact" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') <(echo $config) | awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --preview-window=right --height 60% --scheme=path --cycle --algo=v2 --preview='echo {} | cut -d" " -f 2- | xargs /home/$USER/scripts/fzf-preview.sh && echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null' | sed "s;^~;/home/$USER;g")



[[ "$filter" = "explore" ]] && selection=$(cat <(echo " ..") <(find $dir -maxdepth 1 2>/dev/null | sed "s;^\./;;" | grep -Evx "^\." | xargs -L 1 eza -d --icons=always 2>/dev/null) | awk '!a[$0]++' | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --preview-window=right --scheme=path --cycle --algo=v2 --preview='echo {} | cut -d" " -f 2- | xargs /home/$USER/scripts/fzf-preview.sh && echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null' | cut -d" " -f 2- | sed "s;^;$PWD/;" | sed "s;^~;/home/$USER;g")



[[ $selection =~ ".* -> .*" ]] && selection=$(echo $selection | cut -d" " -f 3-) # symlinks


[[ "$filter" = "explore" ]] && [[ $selection = ".." ]] && cd .. && fuzzy . explore && return 0

[[ $selection = ".." ]] || [[ "$filter" = "explore" ]] && [[ $(file $selection | awk '{print $2}') = "directory" ]] && cd $selection && fuzzy . explore && return 0













[[ "$filter" = "copypath" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') <(echo $config) | awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fuzzyfind | sed "s;^~;/home/$USER;g" | tr -d '\n' | xsel -b)

[[ "$filter" = "copypath" ]] && echo $selection && return 0








# EXPERIMENTAL

#[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{30,}' | xargs -L 1 eza --icons=always -d 2>/dev/null | 2>/dev/null) <(echo $config) | awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --preview-window=right --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null' | cut -d" " -f 2- | sed "s;^~;/home/$USER;g")




[[ "$filter" = "fzy" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') <(echo $config) | awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzy | sed "s;^~;/home/$USER;g")





[[ "$filter" = "icons" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 6 -mount 2>/dev/null | grep -vEi '/opt/|/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{30,}' | xargs -L 1 eza -d --icons=always 2>/dev/null) <(echo $config) | awk '!a[$0]++{print}' | grep -Evx "$ignore" | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --ansi --scroll-off=5 --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s@^~@/home/$USER@g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s@^~@/home/$USER@g" | xargs bat -p --color=always 2>/dev/null' | cut -d" " -f 2- | sed "s@^~@/home/$USER@g")




[[ "$filter" = "none" ]] && selection=$(cat <(echo $recent) <(find $dir 2>/dev/null) <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --ansi --scroll-off=5 --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s@^~@/home/$USER@g" | xargs file | cut -d" " -f 2- && echo "" && echo {} | sed "s@^~@/home/$USER@g" | xargs bat -p --color=always 2>/dev/null' | sed "s@^~@/home/$USER@g")




[[ "$filter" = "onlydir" ]] && selection=$(cat <(echo $recent | sed 1q) <(find $dir -maxdepth 8 -mount -type d 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --ansi --scroll-off=5 --scheme=path --cycle --algo=v2 --preview='echo {} | sed "s@^~@/home/$USER@g" | xargs file | cut -d" " -f 2- && echo "" && echo {} | sed "s@^~@/home/$USER@g" | xargs bat -p --color=always 2>/dev/null' | sed "s@^~@/home/$USER@g")


[[ $selection ]] || return 0



# TIME TEST
#[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | sed "s;^~;/home/$USER;g" 1>&2>/dev/null)









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


# -type d,f,l -size +1k




#[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 7 -mount 2>/dev/null | grep -vEi '/usr/lib32/|/usr/include/|/usr/lib/|/opt/|/var/|/proc/|/dev/|/tmp/|cache|/sys/|.{50,}') <(echo $config) | awk '!a[$0]++' | sed "s;^\.;$PWD;g" | grep -Evx "$ignore" | sed "s;/home/$USER;~;g" | fzf --ansi --scroll-off=5 --preview-window=right --scheme=path --cycle --algo=v2 --preview='echo {} | cut -d" " -f 2- | xargs /home/$USER/scripts/fzf-preview.sh && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs file | grep -vE "cannot open" | cut -d" " -f 2- && echo "" && echo {} | sed "s;^~;/home/$USER;g" | xargs bat -p --color=always 2>/dev/null' | sed "s;^~;/home/$USER;g")





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
[[ "$extension" = "c" ]] || [[ "$extension" = "py" ]] || [[ "$extension" = "lua" ]] || [[ "$extension" = "cpp" ]] || [[ "$extension" = "sh" ]] && cd $dirpath && $EDITOR $selection && return 0

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
[[ "$selection" = "#run with fzy" ]] && fuzzy $dir fzy && return 0
[[ "$selection" = "#show a compact prompt" ]] && fuzzy $dir compact && return 0
[[ "$selection" = "#copy the file path" ]] && fuzzy $dir copypath && return 0
[[ "$selection" = "#filter: icons" ]] && fuzzy $dir icons && return 0
[[ "$selection" = "#filter: only dirs" ]] && fuzzy $dir onlydir && return 0







