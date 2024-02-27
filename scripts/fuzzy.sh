#!/bin/sh



#     __                     
#    / _|_   _ _________   _ 
#   | |_| | | |_  /_  / | | |
#   |  _| |_| |/ / / /| |_| |
#   |_|  \__,_/___/___|\__, |
#                      |___/ 



# Usage: $ fuzzy <dir> <filter>
# default dir: /
# if the filter flag is selected, no filters will be applied (longer loading time)

# Allows you to fuzzy find all files on the system on then opens files with corresponding programs

# ToDo:
# Icons
# Sort Files
# add better filtering
# fix /home/ and . issue
# show most recent files first
# show "startpage": user can put in their most used files that will be shown at startup -- maybe at file list like $config and then run diff?
# -type f takes a bit longer at startup and then gets faster -- maybe run the script silently at boot? timeout 5 ~/scripts/fuzzy.sh
# bat error "#filter: ..." no such file or directory FIXED





#config=$(echo -e "#search in cwd\n#search in /\n#toggle filter\n#filter on\n#filter off") # possibly "\" ?


config=$(echo -e "\
#search in .\n\
#search in /\n\
#search in ~\n\
#filter: default\n\
#filter: none\n\
#filter: only dirs\
") # possibly "\" ?






dir=$1
[[ "$dir" = "" ]] && dir="/"

filter=$2
[[ "$filter" = "" ]] && filter="default"



# Add your most used dires/files here, to make them show up on start

recent=$(echo -e "\
/home/$USER/scripts/fuzzy.sh\n\
/home/$USER/scripts\n\
/home/$USER/.zshrc\n\
/home/$USER/.xinitrc\n\
/home/$USER/.config\n\
/home/$USER/.config/qtile/config.py\n\
/home/$USER/.config/nvim\n\
/home/$USER/.config/picom\
")

#recent=$(find $dir -type f -maxdepth 8 -mount -printf "%T@ %p\n" 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}' | sort -n | tail -n 50 | cut -d' ' -f 2-)



# -type f for regular files --- 50 is max char limit --- awk is for removing duplicate lines like uniq but you dont have to sort


[[ "$filter" = "default" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 8 -mount -type f 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' | sed "s@^~@/home/$USER@g")


[[ "$filter" = "none" ]] && selection=$(cat <(echo $recent) <(find $dir 2>/dev/null) <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' | sed "s@^~@/home/$USER@g")


[[ "$filter" = "onlydir" ]] && selection=$(cat <(echo $recent) <(find $dir -maxdepth 8 -mount -type d 2>/dev/null | grep -vEi '/proc/|/dev/|/tmp/|cache|/sys/' | grep -iwExv '.{50,}') <(echo $config) | awk '!a[$0]++{print}' | sed "s@^\.@$PWD@g" | sed "s@/home/$USER@~@g" | fzf --preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' | sed "s@^~@/home/$USER@g")










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
shebang=$(command cat $selection 2>/dev/null | sed 1q | grep \#!)
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







